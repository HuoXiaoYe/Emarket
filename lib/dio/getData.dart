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



// import "package:dio/dio.dart";
// import 'dart:async';
// import 'dart:io';

// Future request(url,{formData})async{
//     try{
//       //print('开始获取数据...............');
//       Response response;
//       Dio dio = new Dio();
//       dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
//       if(formData==null){
        
//           response = await dio.post(servicePath[url]);
//       }else{
//           response = await dio.post(servicePath[url],data:formData);
//       }
//       if(response.statusCode==200){
//         return response.data;
//       }else{
//           throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
//       }
//     }catch(e){
//         return print('ERROR:======>${e}');
//     } 
// }
