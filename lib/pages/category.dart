// import 'package:dio/dio.dart';
// import 'dart:convert';

import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "../dio/getData.dart";
import "../config/service_url.dart";
import '../model/categoryModel.dart';
class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("商品分类"),
      ),
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
  // List<String> categoryList;
  List categoryList = [];
  List childCategory;

// 请求数据的方法
  void _getCategoryData() async{
    // List catagoryList;
    await request(servicePath['category']).then((response){
     CategoryModel catagoryList = CategoryModel.fromJson(response);
    var res = catagoryList.data.map((item) => item.mallCategoryName).toList();
    // 绑定数据
    setState(() {
      // categoryList = res;
      categoryList = catagoryList.data;
      // childCategory = catagoryList.data;
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
          // var currentChildCategory = childCategory[index].bxMallSubDto;
          // print(categoryList[index].bxMallSubDto[0].mallSubName);

        categoryList[index].bxMallSubDto.forEach((item){
          print(item.mallSubName);
        });
        });
      },
        child: Container(
        alignment: Alignment.center,
        height: ScreenUtil.getInstance().setHeight(80),
        width: ScreenUtil.getInstance().setWidth(180),
        child: Text(
          categoryList[index].mallCategoryName,
          style: TextStyle(
              color: currentIndex == index ? Colors.white : Colors.black),
        ),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.black26)),
            color: currentIndex == index ? Colors.red : Colors.white),
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
