import 'package:flutter/material.dart';
import 'package:flutterappflutterreduxdemo/state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'action.dart';

//对事件的处理

//reducer的第一种写法
class ActionReducer extends ReducerClass<AppState> {
  @override
  AppState call(AppState state, action) {

    if (action is SomeOneAction) {

      return state
        ..name = "SomeOneAction";

    } else if (action is SomeTwoAction) {

      return state
        ..name = "SomeTwoAction";

    } else if (action is SomeThreeAction) {

      SomeThreeAction current = action;

      return state
        ..name = "SomeThreeAction" + current.info;

    } else if (action is ThemeDataAction) {

      ThemeDataAction themeDataAction = action;
      ThemeData themeData = ThemeData(
        primarySwatch: themeDataAction.color,
      );
      return state
            ..themeData = themeData;

    } else if (action is ActionLists) {

      return state
        ..name = "这是一个enum事件 + " + action.toString();

    } else {

      return state;
    }
  }
}


//reducer的第二种写法
final reducer = (AppState state, action) {

  if (action is SomeOneAction) {

    return state
      ..name = "SomeOneAction";

  } else if (action is SomeTwoAction) {

    return state
      ..name = "SomeTwoAction";

  } else if (action is SomeThreeAction) {

    SomeThreeAction current = action;

    return state
      ..name = "SomeThreeAction" + current.info;

  } else if (action is ThemeDataAction) {

    ThemeDataAction themeDataAction = action;
    ThemeData themeData = ThemeData(
      primarySwatch: themeDataAction.color,
    );
    return state
      ..themeData = themeData;

  } else if (action is ActionLists) {

    return state
      ..name = "这是一个enum事件 + " + action.toString();

  } else {

    return state;
  }
};


//reducer第三种写法
final Reducer<AppState> appReducer = combineReducers([
  new TypedReducer<AppState, SomeOneAction>(someOneReducer),
  new TypedReducer<AppState, SomeTwoAction>(someTwoReducer),
  new TypedReducer<AppState, SomeThreeAction>(someThreeReducer),
  new TypedReducer<AppState, ThemeDataAction>(themeReducer),
  new TypedReducer<AppState, ActionLists>(actionListsReducer),
]);

final someOneReducer = (AppState state, SomeOneAction data) {

  return state
    ..name = "SomeOneAction";
};
final someTwoReducer = (AppState state, SomeTwoAction data) {

  return state
    ..name = "SomeTwoAction";
};
final someThreeReducer = (AppState state, SomeThreeAction data) {

  return state
    ..name = "SomeThreeAction" + data.info;
};

final themeReducer = (AppState state, ThemeDataAction data) {

  ThemeData themeData = ThemeData(
    primarySwatch: data.color,
  );
  return state
    ..themeData = themeData;
};

final actionListsReducer = (AppState state, ActionLists data) {

  return state
    ..name = "这是一个enum事件 + " + data.toString();
};

