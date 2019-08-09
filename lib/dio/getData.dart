import "../config/service_url.dart";
import 'package:dio/dio.dart';
import '../model/categoryModel.dart';
import 'dart:convert';
// 获取分类页面分类的函数

void getCategory() async {
  print(servicePath['category']);
  try {
    Response response = await Dio().get(servicePath['category']);
    var data = json.decode(response.toString());
    print(data['data'][0]['mallCategoryName']);
  } catch (e) {
    print(e);
  }
}
