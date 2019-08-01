import "package:flutter/material.dart";

// 引入dio库
import "package:dio/dio.dart";





class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getHttp();
    return Scaffold(
      body: Center(child: Text("商城首页"),),
    );
  }




  void getHttp() async{
    try{
      Response response;
      const url = "https://www.easy-mock.com/mock/5c60131a4bed3a6342711498/baixing/dabaojian?name=长腿小姐姐";
      response = await Dio().get(url);
      return print(response);
    }catch(e){
      print(e);
    }
  }
}