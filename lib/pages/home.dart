import 'package:flutter/material.dart';
import "./common_component/banner.dart";

import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List swiperDataList = [
    "images/banner/a1.jpg",
    "images/banner/a2.jpg",
    "images/banner/a3.jpg",
    "images/banner/a4.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750.0,height: 1334)..init(context); // 
    return Scaffold(
      appBar: PreferredSize(
          child: AppBar(
            title: Text("霍小叶电商项目"),
            centerTitle: true,
          ),
          preferredSize: Size.fromHeight(50.0)),
      body: Column(
        children: <Widget>[
          MySwiper(swiperDataList) // 轮播图
        ],
      ),
    );
  }
}
