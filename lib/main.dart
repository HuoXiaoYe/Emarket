import "package:flutter/material.dart";
import "pages/indexPage.dart";
import './store/bloc.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChildCategoryProvider(
        bloc: ChildCategoryList(),
        child: MaterialApp(
            title: "霍小叶电商项目",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(primarySwatch: Colors.red),
            home: IndexPage()),
      ),
    );
  }
}
