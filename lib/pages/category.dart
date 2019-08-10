// import 'package:dio/dio.dart';
import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "../dio/getData.dart";
import "../config/service_url.dart";
import '../model/categoryModel.dart';
class Category extends StatelessWidget {


  


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child:
          Row(
            children: <Widget>[
              LeftCategory(),
            ],
          )
      ),
    );
  }
}

class LeftCategory extends StatefulWidget {
  @override
  _LeftCategoryState createState() => _LeftCategoryState();
}

class _LeftCategoryState extends State<LeftCategory> {
  int currentIndex = 0;
  List<String> categoryList = [
    "分类1",
    "分类2",
    "分类3",
    "分类4",
    "分类5",
    "分类6",
    "分类7",
    "分类8",
    "分类9",
    "分类10",
    "分类11",
    "分类12",
    "分类13",
    "分类14",
    "分类15",
    "分类16",
    "分类17",
    "分类18",
    "分类19",
    "分类20",
  ];

// 请求数据的方法
  void _getCategoryData() async{
    // List catagoryList;
    await request(servicePath['category']).then((response){
     CategoryModel catagoryList = CategoryModel.fromJson(response);
     
    // catagoryList.data.forEach((item){
    //   print(item.mallCategoryName);
    // });

    var res = catagoryList.data.map((item) => item.mallCategoryName).toList();
    // 绑定数据
    setState(() {
      categoryList = res;
    });

    });
  }

  @override
  void initState() { 
    super.initState();
   _getCategoryData();
  }



  Widget _leftCategoryItem(BuildContext context, index) {
    return InkWell(
      onTap: (){
        setState(() {
          currentIndex = index;
        });
      },
        child: Container(
        alignment: Alignment.center,
        height: ScreenUtil.getInstance().setHeight(80),
        width: ScreenUtil.getInstance().setWidth(180),
        child: Text(
          categoryList[index],
          style: TextStyle(
              color: currentIndex == index ? Colors.white : Colors.black),
        ),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.black26)),
            color: currentIndex == index ? Colors.redAccent : Colors.white),
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.getInstance().setWidth(180),
      // height: ScreenUtil.getInstance().setHeight(2800),
      decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1, color: Colors.black26))),
      child: ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return _leftCategoryItem(context, index);
        },
      ),
    );
  }
}
