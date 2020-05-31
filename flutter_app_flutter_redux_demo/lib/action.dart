import 'package:flutter/material.dart';

//action里面是动作，如果传值的话就是class，建议直接写成class，可以做一个模型封装也行

enum ActionLists{
  action1,
  action2,
  action3
}

class SomeOneAction {}

class SomeTwoAction {}

class SomeThreeAction {

  String info;

  SomeThreeAction({this.info});
}

class ThemeDataAction {

  MaterialColor color;

  ThemeDataAction({this.color});
}
