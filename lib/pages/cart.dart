import 'dart:convert';

import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<String> goodsList = [];
  @override
  Widget build(BuildContext context) {
    _showGoods();
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 400,
            child: ListView.builder(
              itemCount: goodsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(goodsList[index]),
                );
              },
            ),
          ),
          RaisedButton(
            child: Text("+"),
            onPressed: () {
              _addGoods();
            },
          ),
          RaisedButton(
            child: Text("--"),
            onPressed: () {
              _delGoods();
            },
          )
        ],
      ),
    );
  }

  _showGoods() async {
    SharedPreferences goods = await SharedPreferences.getInstance();
    if (goods.getStringList("goods") != null) {
      setState(() {
        goodsList = goods.getStringList("goods");
      });
    }
  }

  _addGoods() async {
    SharedPreferences goods = await SharedPreferences.getInstance();
    goodsList.add("小米9");
    goods.setStringList("goods", goodsList);
    setState(() {
      goodsList = goods.getStringList("goods");
    });
  }

  _delGoods() async {
    SharedPreferences goods = await SharedPreferences.getInstance();
    goods.remove("goods");
    setState(() {
      goodsList = [];
    });
  }
}
