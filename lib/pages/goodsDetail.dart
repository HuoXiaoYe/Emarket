import 'package:flutter/material.dart';
import '../dio/getData.dart';
import '../config/service_url.dart';
import '../model/GoodsModel.dart';
import 'dart:convert';


class GoodsDetail extends StatefulWidget {
  @override
  _GoodsDetailState createState() => _GoodsDetailState();
}

class _GoodsDetailState extends State<GoodsDetail> {
  var goodsInfo;
  @override
  Widget build(BuildContext context) {
    _getGoodsInfo();
    return Container(
      child:Text("goodsInfo")
    );
  }


  _getGoodsInfo() async{
    await request(servicePath['goodsdetail']).then((val){
      // print(val['data']['goodInfo']['amount']);
      GoodsDetailModel info = GoodsDetailModel.fromJson(val);
      
      
      // print(info.data.goodInfo.isOnline);
      setState(() {
        goodsInfo = info.data;
        print(info.data.goodInfo.isOnline);
      });
    });
  }
}