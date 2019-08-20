import 'package:flutter/material.dart';
import "package:scoped_model/scoped_model.dart";
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CartProvider extends Model {
  List<Map> _goodsList = [];
  get goodsList => _goodsList;

// 保存数据的方法
  save(goodsId, goodsName, count, price, images) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var cartInfoString = prefs.getString("cartInfo");
    var temp =
        cartInfoString == null ? [] : json.decode(cartInfoString.toString());
    List<Map> tempList = (temp as List).cast();
    bool isExist = false; // 购物车中是否有当前商品
    int index = 0;

    tempList.forEach((item) {
      if (item["goodsId"] == goodsId) {
        tempList[index]["count"] = item["count"] + 1;
        isExist = true;
      }
      index++;
    });

    if (!isExist) {
      // 购物车中没有该商品
      tempList.add({
        'goodsId': goodsId,
        'goodsName': goodsName,
        'count': count,
        'price': price,
        'images': images
      });
    }

    prefs.setString("cartInfo", json.encode(tempList).toString());
    _goodsList = tempList;
    notifyListeners();
  }
}
