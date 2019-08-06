import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import "./common_component/banner.dart";

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/static_assets.dart';

import "package:url_launcher/url_launcher.dart";

// 上拉加载更多
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List data = [1, 2, 3, 4, 5, 6];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            title: Text("霍小叶电商项目"),
            centerTitle: true,
          ),
          preferredSize: Size.fromHeight(50.0)),
      body: EasyRefresh(
        onLoad: () async {
          setState(() {
            data.addAll([1]);
          });
        },
        footer: MaterialFooter(),
        child: ListView(
          children: <Widget>[
            MySwiper(swiperDataList), // 轮播图
            Topnavigator(navIconList), // 导航栏
            AdBanner(imgAdBanner), // 图片
            LeadPhone(imgPhone, "17725350095"), // 一键打电话
            Recommend(recommendData),
            MyCommend(commendData: recommendData),
            // CircleAvatar(),
            NoName(noNameData), // 无题专区
            NoName(noNameData), // 无题专区
            HotProduct(data)
            // _HotProductState(data)
          ],
        ),
      ),
    );
  }
}

// 导航栏
class Topnavigator extends StatelessWidget {
  final List navList;
  Topnavigator(this.navList) : super();

  // 每一个导航的小图标
  Widget _gridViewItemUI(BuildContext context, item) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Image.network(
            item["imgUrl"],
            width: ScreenUtil.getInstance().setWidth(95),
          ),
          Text(
            item["desc"],
            style: TextStyle(
                // height: 20.0
                // height: 20
                ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      height: ScreenUtil.getInstance().setHeight(340),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 5,
        // crossAxisSpacing: 5,
        padding: EdgeInsets.all(3.0),
        children: navList.map((item) {
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}

//

class AdBanner extends StatelessWidget {
  final String picture;
  AdBanner(this.picture) : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        picture,
        fit: BoxFit.fitWidth,
        width: ScreenUtil.getInstance().setWidth(700),
      ),
    );
  }
}

// 一键拨打店长电话区域

class LeadPhone extends StatelessWidget {
  final String leadingimg;
  final String leadingPhone;

  LeadPhone(this.leadingimg, this.leadingPhone) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        child: Image.asset(
          leadingimg,
          width: ScreenUtil.getInstance().setWidth(700),
          fit: BoxFit.fill,
        ),
        onTap: () {
          // 点击拨打电话
          _launcher_url();
        },
      ),
    );
  }

  void _launcher_url() async {
    // String url = "tel:" + leadingPhone; // 打电话
    String url = "http://jspang.com"; // 浏览网页
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw ('url不能进行访问');
    }
  }
}

// 商品推荐 列表

class Recommend extends StatelessWidget {
  final List myList;
  Recommend(this.myList) : super();

  Widget _myTitle(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft, // 居中靠左对齐
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
      child: Text(
        "热门推荐",
        style: TextStyle(color: Colors.pink),
      ),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
    );
  }

  Widget _myListTile(BuildContext context, item) {
    return InkWell(
      child: Container(
        height: ScreenUtil.getInstance().setHeight(380),
        width: ScreenUtil.getInstance().setWidth(250),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(color: Colors.black12, width: 0.5),
                right: BorderSide(color: Colors.black12, width: 0.5))),
        child: Column(
          children: <Widget>[
            Image.asset(item['img']),
            Expanded(
              child: Container(),
            ),
            Expanded(
              child: Container(),
            ),
            Text(item['newPrice'] + "元"),
            Expanded(
              child: Container(),
            ),
            Text(
              item['oldPrice'] + "元",
              style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.black26,
              ),
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }

  Widget _list(BuildContext context) {
    return SizedBox(
      height: ScreenUtil.getInstance().setHeight(400),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: myList.map((item) => _myListTile(context, item)).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(myList.length);
    return Container(
        margin: EdgeInsets.only(top: 20.0),
        height: ScreenUtil.getInstance().setHeight(450),
        color: Colors.white,
        child: Column(
          children: <Widget>[_myTitle(context), _list(context)],
        ));
  }
}

class MyCommend extends StatelessWidget {
  final List commendData;
  const MyCommend({Key key, this.commendData}) : super(key: key);

  // 标题组件

  Widget _myTitle(BuildContext context) {
    return Container(
        height: 40.0,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Text(
          "热门推荐",
          style: TextStyle(color: Colors.pink),
        ));
  }

  // 热门推荐的每一个item
  Widget _myItem(BuildContext context, item) {
    return InkWell(
      child: Container(
          height: ScreenUtil.getInstance().setHeight(330),
          padding: EdgeInsets.all(5),
          width: ScreenUtil.getInstance().setWidth(250),
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: Colors.black12, width: 1),
            right: BorderSide(color: Colors.black12, width: 0.5),
            left: BorderSide(color: Colors.black12, width: 0.5),
          )),
          child: Column(
            children: <Widget>[
              Image.asset(
                item['img'],
                width: 90,
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                "${item['newPrice']}元",
                style: TextStyle(fontSize: 14),
              ),
              Expanded(
                child: Container(),
              ),
              Text(
                "${item['oldPrice']}元",
                style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.black45,
                    fontSize: 12.0),
              ),
            ],
          )),
    );
  }

  // 推荐list
  Widget _myList(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(300),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: commendData.map((item) => _myItem(context, item)).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: ScreenUtil.getInstance().setHeight(400),
      color: Colors.white,
      child: Column(
        children: <Widget>[_myTitle(context), _myList(context)],
      ),
    );
  }
}

// 制作一个头像
// class CircleAvatar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: CircleAvatar(
//         backgroundImg: NetworkImage("")
//       )
//     );
//   }
// }

// 无题专区

class NoName extends StatelessWidget {
  List myData;
  NoName(this.myData) : super();

  Widget _title(BuildContext context) {
    return Container(
      height: 100,
      child: Image.asset("images/titile.PNG"),
    );
  }

  Widget _firstRow(
    BuildContext context,
  ) {
    return Row(
      children: <Widget>[
        Container(
          width: ScreenUtil.getInstance().setWidth(375),
          child: Image.asset("images/c1.PNG"),
        ),
        Container(
          width: ScreenUtil.getInstance().setWidth(375),
          child: Column(
            children: <Widget>[
              Image.asset("images/c2.PNG"),
              Image.asset("images/c3.PNG"),
            ],
          ),
        )
      ],
    );
  }

  Widget _secondRow(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: ScreenUtil.getInstance().setWidth(375),
          child: Image.asset("images/c4.PNG"),
        ),
        Container(
          width: ScreenUtil.getInstance().setWidth(375),
          child: Image.asset("images/c5.PNG"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _title(context),
        _firstRow(context),
        _secondRow(context),
      ],
    );
  }
}

// 火爆专区页面 实现下拉加载更多

class HotProduct extends StatelessWidget {
  List hotData;
  HotProduct(this.hotData) : super();
  @override
  Widget _item(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(372),
      height: ScreenUtil.getInstance().setWidth(375),
      margin: EdgeInsets.only(bottom: 3),
      child: Image.asset(
        "images/hot1.PNG",
        fit: BoxFit.fill,
      ),
      // child: null,
    );
  }

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: 30,
                height: 30,
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.red,
                ),
                child: Icon(
                  Icons.hot_tub,
                  color: Colors.white,
                ),
              ),
              Text("火爆专区")
            ],
          ),
        ),
        Wrap(
          spacing: 2,
          children: hotData.map((item) => _item(context)).toList(),
        )
      ],
    );
  }
}
