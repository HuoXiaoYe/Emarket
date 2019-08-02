// 所有请求数据方法的文件
import "package:dio/dio.dart";
import "dart:async";
import 'dart:io';
import '../config/service_url.dart';

// 获取首页主体内容

Future getHomePageContent() async{
  print("开始获取首页数据");
  Response response;
  Dio dio = new Dio();
  dio.options.contentType = ContentType.parse("application/x-www-dorm-urlencoded");
  var formData = {"lon":'115.02932','lat':'35.76189'};
  response = await dio.post(servicePath['homePageContent'],data: formData);
  if(response.statusCode == 200){
    return response.data;
  }else{
    throw Exception("后端接口出现异常");
  }

}