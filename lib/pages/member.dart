import "package:flutter/material.dart";

class Member extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            MyAvatar() // 顶部头像部分
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
            child: Text("杭州吴亦凡",
              style: TextStyle(
                fontSize: 18
              ),
            ),
          )
        ],
      ),
    );
  }
}
