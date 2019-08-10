import 'package:meta/meta.dart';


@immutable
class ChildCategoryStore{
  
  List childCategory;
  get childCategoryList => childCategory;

  ChildCategoryStore(this.childCategory);
}


enum Action{
  changeList
}

ChildCategoryStore reducer(ChildCategoryStore state,action){
  //匹配Action
    if(action.type == Action.changeList){
      return ChildCategoryStore(state.childCategoryList);
    }
    print(action);
    return state;
}