import "../config/service_url.dart";
import 'package:dio/dio.dart';
// 获取分类页面分类的函数

void getCategory() async {
  print(servicePath['category']);
  try {
    Response response = await Dio().get(servicePath['category']);
    print(response);
  } catch (e) {
    print(e);
  }
}