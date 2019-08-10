import 'package:dio/dio.dart';
import 'dart:convert';
// 获取分类页面分类的函数
// void getCategory() async {
//   print(servicePath['category']);
//   try {
//     Response response = await Dio().get(servicePath['category']);
//     var data = json.decode(response.toString());
//     CategoryModel list = CategoryModel.fromJson(data);
//      list.data.forEach((item)=>print(item.mallCategoryName));
//   } catch (e) {
//     print(e);
//   }
// }


// 异步请求数据的方法
Future request(url) async {
    Response response = await Dio().get(url);
    var data = json.decode(response.toString());
    return data;
}



// 函数 测试
// getData() async{
//   await request(servicePath['category']).then((val){
//     // print()
//     CategoryModel list = CategoryModel.fromJson(val);
//     print(list.data);
//     list.data.map((item){
//       return print(item.mallCategoryName);
//     });
//   });
// }
