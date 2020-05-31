import 'package:flutter/material.dart';
import 'package:flutterappflutterreduxdemo/action.dart';
import 'package:flutterappflutterreduxdemo/state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {

    Store<AppState> store = StoreProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("第二页"),
      ),
      body: StoreBuilder<AppState>(builder: (_,Store store){
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(store.state.name),
              FlatButton(onPressed: (){
                store.dispatch(ActionLists.action1);
              }, child: Text("这是一个enum事件1")),
              FlatButton(onPressed: (){
                store.dispatch(ActionLists.action2);
              }, child: Text("这是一个enum事件2")),
              FlatButton(onPressed: (){
                store.dispatch(ActionLists.action3);
              }, child: Text("这是一个enum事件3")),
              FlatButton(onPressed: (){
                store.dispatch(SomeOneAction());
              }, child: Text("这是一个class事件")),
              FlatButton(onPressed: (){
                store.dispatch(SomeThreeAction(info: "3333333"));
              }, child: Text("这是一个class事件传值info"))
            ],
          )
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //响应事件 传参的话需要使用class或者像fish_redux那样定义指定数据格式包装payload
          store.dispatch(ThemeDataAction(color:Colors.deepPurple));
        },
        tooltip: "切换主题颜色",
        child: Icon(Icons.cached),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
