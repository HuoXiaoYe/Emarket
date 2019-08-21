import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoped_model/scoped_model.dart';
import '../provider/cart.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<bool> isCHeckedarr = [true,true,true];
  Widget _cartItem(index) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(3, 15, 10, 20),
      height: ScreenUtil.getInstance().setHeight(220),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      child: Row(
        children: <Widget>[
          Container(
            // 左侧选择按钮
            child: Checkbox(
              value: isCHeckedarr[index],
              activeColor: Colors.pink,
              onChanged: (bool val) {
                setState(() {
                 isCHeckedarr[index] = val; 
                });
              },
            ),
          ),
          Container(
            // 商品图片
            width: ScreenUtil.getInstance().setWidth(150),
            padding: EdgeInsets.all(3),
            child: Image.network(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566313374600&di=6522586356bdaf2a7c3813c4de8824ea&imgtype=0&src=http%3A%2F%2Fimg05.jdzj.com%2Foledit%2FUploadFile%2Fnews2014%2Fimage%2F20140228%2F20140228115735233523.jpg"),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey)),
          ),
          Container(
            alignment: Alignment.centerLeft,
            //商品价格和数量
            width: ScreenUtil.getInstance().setWidth(350),
            margin: EdgeInsets.only(top: 10,left: 10),
            child: Column(
              children: <Widget>[Text("青岛啤酒450ml(易拉罐装)")],
            ),
          ),
          Container( // 商品价格和删除按钮
          // alignment: Alignment.topCenter,
            margin: EdgeInsets.only(top: 10),
            width: ScreenUtil.getInstance().setWidth(120),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("￥4.50"),
                InkWell(
                  onTap: (){},
                  child: Icon(Icons.delete_forever,size: 36,color: Colors.black26,),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bottomArea(){
    return Container(
      height: 60,
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CartProvider>(
      model: CartProvider(),
      child: Container(
        child: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => _cartItem(index),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: bottomArea(),
            )
          ],
        ),
      ),
    );
  }
}
