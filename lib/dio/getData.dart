import 'package:dio/dio.dart';
import 'dart:convert';
// 异步请求数据的方法
Future request(url) async {
    Response response = await Dio().get(url);
    var data = json.decode(response.toString());
    return data;
}



// 函数 测试
// getData() async{
//   await request(servicePath['category']).then((val){
//     CategoryModel list = CategoryModel.fromJson(val);
//     print(list.data);
//     list.data.map((item){
//       return print(item.mallCategoryName);
//     });
//   });
// }
