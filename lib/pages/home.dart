import 'package:flutter/material.dart';
import '../service/service_methods.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List swiperDataList = [
    "images/banner/a1.jpg",
    "images/banner/a2.jpg",
    "images/banner/a3.jpg",
    "images/banner/a4.jpg"
  ].cast();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('霍小叶电商项目'),
        ),
        body: Column(
          children: <Widget>[
            SwiperDiy(swiperDataList), //页面顶部轮播组件
          ],
        ));
  }
}

/*

FutureBuilder(
          future: getHomePageContent(),
          builder: (context, snapshot) {
            List swiperDataList = [
              "images/banner/a1.jpg",
              "images/banner/a2.jpg",
              "images/banner/a3.jpg",
              "images/banner/a4.jpg"
            ].cast();
            return Column(
              children: <Widget>[
                SwiperDiy(swiperDataList: swiperDataList), //页面顶部轮播组件
              ],
            );
          },
        ),


*/

// 首页轮播组件编写
class SwiperDiy extends StatelessWidget {
  final List swiperDataList;
  SwiperDiy(this.swiperDataList) : super();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset("${swiperDataList[index]}", fit: BoxFit.fill);
        },
        itemCount: swiperDataList.length,
        pagination: new SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}
