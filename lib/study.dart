// 1. 请求数据和获取数据

// 定义方法
// import "package:dio/dio.dart";
// import 'dart:async';
// import 'dart:io';
// import "./config/service_url.dart";
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
//         return print('ERROR:======>$e');
//     }    
// }



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




// 2. flutter_redux
// import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';


// 2.1 创建 state
class AppState {
  ThemeData themeData;

  AppState({this.themeData});

  factory AppState.initial() => AppState(themeData: AppTheme.theme);
}
// AppTheme类中定义了一个默认主题theme
class AppTheme {
  static final ThemeData _themeData = new ThemeData.light();

  static get theme {
    return _themeData.copyWith(
      primaryColor: Colors.black,
    );
  }
}


// 2.2 创建reducer
AppState appReducer(AppState state, action) {
  return AppState(
    themeData: themeReducer(state.themeData, action),
  );
}

final themeReducer = combineReducers<ThemeData>([
  TypedReducer<ThemeData, RefreshThemeDataAction>(_refresh),
]);

ThemeData _refresh(ThemeData themeData, action) {
  themeData = action.themeData;
  return themeData;
}


// 2.3 创建Action
class RefreshThemeDataAction{
  final ThemeData themeData;

  RefreshThemeDataAction(this.themeData);
}