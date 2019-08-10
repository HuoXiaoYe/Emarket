import "package:flutter/material.dart";
import "pages/indexPage.dart";
import 'package:redux/redux.dart';
// import 'package:flutter_redux/flutter_redux.dart';
import './store/redux.dart';

void main() {
  final store = Store<ChildCategoryStore>(reducer);
  runApp(App(store));
}

class App extends StatelessWidget{
  final Store<ChildCategoryStore> store;
  App(this.store);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: "霍小叶电商项目",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.red),
        home: IndexPage()
      ),

    );
  }
}