import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scoped_model/scoped_model.dart';
import '../provider/cart.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  Widget _cartItem() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.fromLTRB(3, 5, 10, 20),
      height: ScreenUtil.getInstance().setHeight(200),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
      child: Row(
        children: <Widget>[
          Container(
            // 左侧选择按钮
            child: Checkbox(
              value: true,
              activeColor: Colors.pink,
              onChanged: (bool val) {},
            ),
          ),
          Container(
            // 商品图片
            width: ScreenUtil.getInstance().setWidth(150),
            padding: EdgeInsets.all(3),
            child: Image.network(
                "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566313374600&di=6522586356bdaf2a7c3813c4de8824ea&imgtype=0&src=http%3A%2F%2Fimg05.jdzj.com%2Foledit%2FUploadFile%2Fnews2014%2Fimage%2F20140228%2F20140228115735233523.jpg"),
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          ),
          Container(
            //商品价格和数量
            width: ScreenUtil.getInstance().setWidth(380),
            margin: EdgeInsets.only(left: 10,top: 10),
            // color: Colors.red,
            child: Column(
              children: <Widget>[Text("青岛啤酒450ml(易拉罐装)")],
            ),
          )
        ],
      ),
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
              itemBuilder: (context, index) => _cartItem(),
            )
          ],
        ),
      ),
    );
  }
}
