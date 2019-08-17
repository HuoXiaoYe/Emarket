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

  Future _getGoodsInfo(context) async{
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
      child: Image.network(image,fit: BoxFit.fill,)
    );
  }
}
