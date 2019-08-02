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
          Topnavigator(navIconList) // 导航栏
        ],
      ),
    );
  }
}





class Topnavigator extends StatelessWidget {
  final List navList;
  Topnavigator(this.navList):super();

  Widget _gridViewItemUI(BuildContext context,item){
    return InkWell(
      onTap: (){

      },
      child: Column(
        children: <Widget>[
          Image.network(item["imgUrl"],width: ScreenUtil.getInstance().setWidth(95),),
          Text(item["desc"])
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().setHeight(320),
      padding: EdgeInsets.all(3.0),
      child: GridView.count(
        crossAxisCount: 5,
        padding: EdgeInsets.all(5.0),
        children: navList.map((item){
          return _gridViewItemUI(context, item);
        }).toList(),
      ),
    );
  }
}
