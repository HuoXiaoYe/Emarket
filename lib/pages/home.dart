import "package:flutter/material.dart";
import '../service/service_methods.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String homePageContent = "正在获取数据";
  @override
  void initState() {
    // 获取远端的数据
    getHomePageContent().then((val){
      setState(() {
        homePageContent = val.toString();
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("霍小叶电商项目"),),
      body: SingleChildScrollView(
        child: Text(homePageContent),
      ),
    );
  }
}



























































// import "package:flutter/material.dart";

// // 引入dio库
// import "package:dio/dio.dart";





// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     getHttp();
//     return Scaffold(
//       body: Center(child: Text("商城首页"),),
//     );
//   }




//   void getHttp() async{
//     try{
//       Response response;
//       const url = "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=长腿小姐姐";
//       response = await Dio().get(url);
//       return print(response);
//     }catch(e){
//       print(e);
//     }
//   }
// }