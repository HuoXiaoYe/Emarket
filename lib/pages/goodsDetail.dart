import 'package:flutter/material.dart';
import '../dio/getData.dart';
import '../config/service_url.dart';
import '../model/GoodsModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsDetail extends StatefulWidget {
  @override
  _GoodsDetailState createState() => _GoodsDetailState();
}

class _GoodsDetailState extends State<GoodsDetail> {
  var goodsInfo;
  bool hasData = false;
  @override
  Widget build(BuildContext context) {
    _getGoodsInfo(context);
    return FutureBuilder(
      future: _getGoodsInfo(context),
      builder: (context, snapData) {
        if (hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text(goodsInfo.goodInfo.goodsName),
            ),
            body: Column(
              // height: ScreenUtil.getInstance().setHeight(height),
              children: <Widget>[
                TopImage(goodsInfo.goodInfo.image1),
                TopInfo(
                  goodsInfo.goodInfo.goodsName,
                  goodsInfo.goodInfo.goodsSerialNumber,
                  goodsInfo.goodInfo.presentPrice,
                  goodsInfo.goodInfo.presentPrice
                )
              ],
            ),
          );
        } else {
          return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                ),
              ));
        }
      },
    );
  }

  Future _getGoodsInfo(context) async {
    await request(servicePath['goodsdetail']).then((val) {
      GoodsDetailModel info = GoodsDetailModel.fromJson(val);
      setState(() {
        goodsInfo = info.data;
        hasData = true;
      });
    });
    return "加载完毕";
  }
}

// 顶部图片区域

class TopImage extends StatelessWidget {
  final String image;
  TopImage(this.image);
  @override
  Widget build(BuildContext context) {
    return Container(
        width: ScreenUtil.getInstance().setWidth(740),
        height: ScreenUtil.getInstance().setWidth(440),
        child: Image.network(
          image,
          fit: BoxFit.fill,
        ));
  }
}

// 头部信息组件

class TopInfo extends StatelessWidget {
  final String title;
  final String goodsId;
  final double nowPrice;
  final double oldprice;
  TopInfo(this.title,this.goodsId,this.nowPrice,this.oldprice)
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.topLeft,
      width: ScreenUtil.getInstance().setWidth(740),
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          Padding(
            padding: EdgeInsets.only(top: 6,bottom: 6),
            child: Text("编号:$goodsId"),
          ),
          Row(
            children: <Widget>[
              Text(
                "￥$nowPrice",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("市场价:"),
              ),
              Text("￥$oldprice",
                style: TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: Colors.grey
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
