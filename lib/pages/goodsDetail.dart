import 'package:flutter/material.dart';
import '../dio/getData.dart';
import '../config/service_url.dart';
import '../model/GoodsModel.dart';


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
      child:Text(goodsInfo.goodInfo.goodsId)
    );
  }


  _getGoodsInfo() async{
    await request(servicePath['goodsdetail']).then((val){
      // print(val['data']['goodInfo']['amount']);
      GoodsDetailModel info = GoodsDetailModel.fromJson(val);
      
      print("=======================");
      print(val);
      print("=======================");
      setState(() {
        goodsInfo = info.data;
      });
    });
  }
}