// import 'package:dio/dio.dart';
// import 'dart:convert';

import 'package:emarket/store/bloc.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "../dio/getData.dart";
import "../config/service_url.dart";
import '../config/static_assets.dart';
import '../model/categoryModel.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("商品分类"),
      ),
      body: Container(
          child: Row(
        children: <Widget>[
          LeftCategory(),
          Column(
            children: <Widget>[RightChildCategory()],
          )
        ],
      )),
    );
  }
}


// 左侧一级分类
class LeftCategory extends StatefulWidget {
  @override
  _LeftCategoryState createState() => _LeftCategoryState();
}

class _LeftCategoryState extends State<LeftCategory> {
  int currentIndex = 0;
  List categoryList = [];
  List childCategory;

// 请求数据的方法
  void _getCategoryData() async {
    // List catagoryList;
    await request(servicePath['category']).then((response) {
      CategoryModel catagoryList = CategoryModel.fromJson(response);
      setState(() {
        categoryList = catagoryList.data;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _getCategoryData();
  }

  Widget _leftCategoryItem(BuildContext context, index) {
    ChildCategoryList _counterBloc = ChildCategoryProvider.of(context).bloc;
    _counterBloc.childCategoryList
                .add(categoryList[0].bxMallSubDto);
    return InkWell(
        onTap: () {
          setState(() {
            // print()
            // 将值赋值给store
            _counterBloc.childCategoryList
                .add(categoryList[index].bxMallSubDto);
            currentIndex = index;
          });

          //
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
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.black26)),
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


// 右侧 二级分类
class RightChildCategory extends StatefulWidget {
  @override
  _RightChildCategoryState createState() => _RightChildCategoryState();
}

class _RightChildCategoryState extends State<RightChildCategory> {
  Widget _rightChildCategoryItem(index,data) {
    return InkWell(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        height: 40,
        padding: EdgeInsets.all(5),
        alignment: Alignment.center,
        child: Text(
          data[index]['mallSubName'],
          style: TextStyle(
              color: currentIndex == index ? Colors.red : Colors.black),
        ),
      ),
    );
  }

  int currentIndex = 0; // 记录亮起的二级导航索引
  @override
  Widget build(BuildContext context) {
    ChildCategoryList _counterBloc = ChildCategoryProvider.of(context).bloc;
    return Container(
      height: 40,
      width: ScreenUtil.getInstance().setWidth(570),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black26))),
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.childList,
        builder: (context, snapshot) {
          // return ListView.builder(
          //   itemCount: snapshot.data.length,
          //   scrollDirection: Axis.horizontal,
          //   itemBuilder: (context, index) => _rightChildCategoryItem(index,snapshot.data),
          // );
          return Container(
            child: Text(snapshot.toString()),
          );
        },
      ),
    );
  }
}

/*
ListView.builder(
        itemCount: bxMallSubDto.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _rightChildCategoryItem(index),
      )
*/
