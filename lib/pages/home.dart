import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import "./common_component/banner.dart";

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/static_assets.dart';

import "package:url_launcher/url_launcher.dart";

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            title: Text("霍小叶电商项目"),
            centerTitle: true,
          ),
          preferredSize: Size.fromHeight(50.0)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MySwiper(swiperDataList), // 轮播图
            Topnavigator(navIconList), // 导航栏
            AdBanner(imgAdBanner), // 图片
            LeadPhone(imgPhone, "17725350095"), // 一键打电话
            Recommend(recommendData),
            MyCommend(commendData:recommendData)
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
         decoration:BoxDecoration(
           border: Border(
             bottom: BorderSide(width: 1,color: Colors.black12)
           )
         ),
        child: Text("热门推荐",style: TextStyle(color: Colors.pink),)
      );
       
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
              Image.asset(item['img'],width: 90,),
              Expanded(child: Container(),),
              Text("${item['newPrice']}元",style: TextStyle(fontSize: 14),),
              Expanded(child: Container(),),
              Text("${item['oldPrice']}元",style: TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.black45,
                fontSize: 12.0
              ),),
            ],
          )),
    );
  }

  // 推荐list
  Widget _myList(BuildContext context){
    return Container(

      height: ScreenUtil.getInstance().setHeight(300),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: commendData.map((item)=>_myItem(context,item)).toList(),
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
        children: <Widget>[
          _myTitle(context),
          _myList(context)
        ],
      ),
    );
  }
}
