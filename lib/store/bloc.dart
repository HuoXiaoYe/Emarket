import 'dart:async';

import 'package:flutter/material.dart';

class ChildCategoryList {
  final _childActionController = StreamController<List>();

  StreamSink<List> get childCategoryList => _childActionController.sink;


  ChildCategoryList(){
    _childActionController.stream.listen(onData);
  }

  void onData(List data){
    print(data);
  }

}

class ChildCategoryProvider extends InheritedWidget {
  ChildCategoryProvider({Key key, this.child,this.bloc}) : super(key: key, child: child);

  final Widget child;

  final ChildCategoryList bloc;

  static ChildCategoryProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(ChildCategoryProvider)as ChildCategoryProvider);
  }

  @override
  bool updateShouldNotify( ChildCategoryProvider oldWidget) {
    return true;
  }
}