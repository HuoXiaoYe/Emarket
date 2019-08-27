import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Member extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            MyAvatar(), // 顶部头像部分
            MyOrder(), // 我的订单部分
          ],
        ),
      ),
    );
  }
}

// 头像 https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4259300811,497831842&fm=26&gp=0.jpg
// 背景图片 https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566834551762&di=12042c3b68d693cc2ba2f46d549b2f2d&imgtype=0&src=http%3A%2F%2Fpic1.16pic.com%2F00%2F51%2F59%2F16pic_5159490_b.jpg

class MyAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          Image.network(
              "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566834551762&di=12042c3b68d693cc2ba2f46d549b2f2d&imgtype=0&src=http%3A%2F%2Fpic1.16pic.com%2F00%2F51%2F59%2F16pic_5159490_b.jpg"),
          // Positioned()
          Positioned(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 2, color: Colors.white)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                    "https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=4259300811,497831842&fm=26&gp=0.jpg"),
              ),
            ),
          ),
          Positioned(
            top: 210,
            child: Text(
              "杭州吴亦凡",
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}

class Split extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0,
    );
  }
}

// 我的订单区域
class MyOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // color: Colors.red,
      child: Column(
        children: <Widget>[
          Row(
            // 我的订单栏
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: ScreenUtil.getInstance().setWidth(100),
                child: Icon(
                  Icons.book,
                  color: Colors.grey,
                ),
              ),
              Container(
                width: ScreenUtil.getInstance().setWidth(550),
                child: Text(
                  "我的订单",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                width: ScreenUtil.getInstance().setWidth(100),
                child: Icon(
                  Icons.navigate_next,
                  size: 36,
                ),
              )
            ],
          ),
          Divider(),
          Row(
            // 四大图标
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Column(
                  children: <Widget>[Icon(Icons.attach_money), Text("待付款")],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: <Widget>[Icon(Icons.train), Text("待发货")],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: <Widget>[Icon(Icons.get_app), Text("待收货")],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: <Widget>[
                    Icon(Icons.record_voice_over),
                    Text(
                      "待评价",
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

// 其他组件
class OtherArea extends StatelessWidget {
  final List items;
  OtherArea(this.items);

  Widget _item(index) {
    return Container(
      child: Row(
        // 我的订单栏
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: ScreenUtil.getInstance().setWidth(100),
            child: Icon(
              Icons.book,
              color: Colors.grey,
            ),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(550),
            child: Text(
              items[index],
              style: TextStyle(fontSize: 18),
            ),
          ),
          Container(
            width: ScreenUtil.getInstance().setWidth(100),
            child: Icon(
              Icons.navigate_next,
              size: 36,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _item(index);
        },
      ),
    );
  }
}
