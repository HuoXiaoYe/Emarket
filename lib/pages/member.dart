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

class MyAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.blue,
        image: DecorationImage(image: NetworkImage("https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1566833438075&di=0968bb8dacfd85de73f4de846892f785&imgtype=0&src=http%3A%2F%2Fgss0.baidu.com%2F7Po3dSag_xI4khGko9WTAnF6hhy%2Fzhidao%2Fpic%2Fitem%2F37d12f2eb9389b5088b262058335e5dde7116e1c.jpg"),
          fit: BoxFit.fill
        )
      ),
    );
  }
}