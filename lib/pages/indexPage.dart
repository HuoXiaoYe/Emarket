// import 'package:flutter/cupertino.dart' as prefix0;
import "package:flutter/material.dart";
import "package:flutter/cupertino.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 导入 四个 主页面

import "home.dart";
import 'member.dart';
import 'category.dart';
import 'cart.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage>{

  // 底部导航栏数组
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), title: Text("分类")),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart), title: Text("购物车")),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled), title: Text("会员")),
  ];
  // 定义四个主页面数组
  final List<Widget> tabBody = [HomePage(),Category(),Cart(),Member()];
  // 当前显示的页面索引
  int _activeIndex = 0;
  // 默认显示的页面
  var activePage;




  @override
  void initState() {
    activePage = tabBody[_activeIndex];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750.0,height: 1334)..init(context); // 
    return Scaffold(
      body: IndexedStack(
        index: _activeIndex,
        children: tabBody,
      ),
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 图标不会抖动
        currentIndex: _activeIndex,
        onTap: (int index){
          setState(() {
            // 重新设置当前的页面和索引
           _activeIndex = index;
           activePage = tabBody[index]; 
          });
        },
        items: [
          bottomTabs[0],
          bottomTabs[1],
          bottomTabs[2],
          bottomTabs[3]
        ],
      ),
    );
  }
}
