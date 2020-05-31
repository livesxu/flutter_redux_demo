import 'package:flutterappflutterreduxdemo/action.dart';
import 'package:redux/redux.dart';
import 'package:flutterappflutterreduxdemo/state.dart';

//相当于过滤、中继

final middleware = (Store<AppState> store,action, NextDispatcher next,) {

  if (action is ActionLists) {

    ActionLists actionLists = action;

    if (actionLists.index == 1) {

      print("can do something");
    }
    next(action);
  } else {

    next(action);
  }
};

final List<Middleware<AppState>> appMiddleware = [
   new TypedMiddleware<AppState, SomeThreeAction>(someThreeMiddleware),
];

final someThreeMiddleware = (Store<AppState> store,SomeThreeAction action, NextDispatcher next,) {

  action.info = action.info + "这是走过一个Middleware添加的内容";

  next(action);
};
