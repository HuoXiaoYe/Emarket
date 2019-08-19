import 'package:flutter/material.dart';
import '../dio/getData.dart';
import '../config/service_url.dart';
import '../model/GoodsModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "../config/static_assets.dart";

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
            body: Stack(
              children: <Widget>[
                ListView(
                  // height: ScreenUtil.getInstance().setHeight(height),
                  children: <Widget>[
                    TopImage(goodsInfo.goodInfo.image1),
                    TopInfo(
                        goodsInfo.goodInfo.goodsName,
                        goodsInfo.goodInfo.goodsSerialNumber,
                        goodsInfo.goodInfo.presentPrice,
                        goodsInfo.goodInfo.presentPrice),
                    Promise(),
                    DescAndComments(),
                  ],
                ),
                MyBottomBar()
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
  TopInfo(this.title, this.goodsId, this.nowPrice, this.oldprice);
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
            padding: EdgeInsets.only(top: 6, bottom: 6),
            child: Text("编号:$goodsId"),
          ),
          Row(
            children: <Widget>[
              Text(
                "￥$nowPrice",
                style: TextStyle(color: Colors.red, fontSize: 20),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("市场价:"),
              ),
              Text(
                "￥$oldprice",
                style: TextStyle(
                    decoration: TextDecoration.lineThrough, color: Colors.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}

// 保证组件

class Promise extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      alignment: Alignment.centerLeft,
      height: ScreenUtil.getInstance().setHeight(100),
      margin: EdgeInsets.only(top: 10, bottom: 10),
      color: Colors.white,
      child: Text(
        "说明 : > 急速送达 > 正品保证",
        style: TextStyle(fontSize: 18, color: Colors.pink),
      ),
    );
  }
}

// 详情和评论页面

class DescAndComments extends StatefulWidget {
  @override
  _DescAndCommentsState createState() => _DescAndCommentsState();
}

class _DescAndCommentsState extends State<DescAndComments>
    with SingleTickerProviderStateMixin {
  TabController _mycontroller;
  @override
  void initState() {
    _mycontroller = TabController(length: 2, vsync: this);
    super.initState();
  }

  Widget _imgItem(item) {
    return Container(
      child: Image.network(item),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 80,
      child: Column(
        children: <Widget>[
          Container(
            height: 40,
            child: TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black38,
              indicatorSize: TabBarIndicatorSize.label,
              controller: _mycontroller,
              tabs: <Widget>[
                Text(
                  "商品详情",
                  style: TextStyle(height: 2),
                ),
                Text("评论列表")
              ],
            ),
          ),
          Container(
            height: 563.1,
            child: TabBarView(
              controller: _mycontroller,
              children: <Widget>[
                ListView(
                    children: detailImg.map((item) => _imgItem(item)).toList()),
                ListView(
                  // 评论组件
                  children: <Widget>[
                    Container(
                      height: 10000,
                      color: Colors.blue,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// 加入购物车 立即购买组件
class MyBottomBar extends StatefulWidget {
  @override
  _MyBottomBarState createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      child: Container(
        width: ScreenUtil.getInstance().setWidth(750),
        height: 40,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Container(
                width: 100,
                child: Icon(Icons.shopping_cart,color: Colors.red,),
              ),
            ),
            Expanded(
              child: Container(
                
                alignment: Alignment.center,
                child: Text("加入购物车",style: TextStyle(color: Colors.white)),
                decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border(
                    right: BorderSide(width: 0.5,color: Colors.white)
                  )
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text("立即购买",style: TextStyle(color: Colors.white),),
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
