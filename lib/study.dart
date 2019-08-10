// 定义方法
import "package:dio/dio.dart";
import 'dart:async';
import 'dart:io';
import "./config/service_url.dart";
Future request(url,{formData})async{
    try{
      //print('开始获取数据...............');
      Response response;
      Dio dio = new Dio();
      dio.options.contentType=ContentType.parse("application/x-www-form-urlencoded");
      if(formData==null){
          response = await dio.post(servicePath[url]);
      }else{
          response = await dio.post(servicePath[url],data:formData);
      }
      if(response.statusCode==200){
        return response.data;
      }else{
          throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
      }
    }catch(e){
        return print('ERROR:======>$e');
    }    
}



// 调用方法
// void _getCategory() async {
//     await request('getCategory').then((val) {
//       var data = json.decode(val.toString());

//       CategoryModel category = CategoryModel.fromJson(data);

//       setState(() {
//         list = category.data;
//       });

//        Provide.value<ChildCategory>(context).getChildCategory( list[0].bxMallSubDto,'4');

//       //print(list[0].bxMallSubDto);

//       //list[0].bxMallSubDto.forEach((item) => print(item.mallSubName));
//     });
//   }
