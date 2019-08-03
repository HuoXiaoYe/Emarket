import 'package:flutter/material.dart';
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
            Recommend(recommendData)
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
      child: Text("热门推荐"),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5, color: Colors.black12))),
    );
  }

  Widget _myListTile(BuildContext context, item) {
    return InkWell(
      child: Container(
        height: ScreenUtil.getInstance().setHeight(300),
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
            Text(item['newPrice']),
            Container(
              height: 4.0,
            ),
            Text(
              item['oldPrice']+"元",
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

  @override
  Widget build(BuildContext context) {
    print(myList.length);
    return SizedBox(
      height: ScreenUtil.getInstance().setHeight(380),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: myList.map((item) => _myListTile(context, item)).toList(),
    ));
  }
}
