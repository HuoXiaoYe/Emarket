import 'package:flutter/material.dart';
import "./common_component/banner.dart";

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/static_assets.dart';

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
      body: Column(
        children: <Widget>[
          MySwiper(swiperDataList), // 轮播图
          Topnavigator(navIconList), // 导航栏
          AdBanner(imgAdBanner),
        ],
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
            style: TextStyle(),
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
  AdBanner(this.picture):super();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(picture,fit: BoxFit.fitWidth,width: ScreenUtil.getInstance().setWidth(700),),
    );
  }
}