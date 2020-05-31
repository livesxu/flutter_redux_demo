import 'package:flutter/material.dart';
import 'package:flutterappflutterreduxdemo/firstPage.dart';
import 'package:flutterappflutterreduxdemo/middleware.dart';
import 'package:flutterappflutterreduxdemo/reducer.dart';
import 'package:flutterappflutterreduxdemo/state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

////  1.指定某一个继承ReducerClass的类作为reducer
//  Store store = Store<AppState>(ActionReducer(),initialState: new AppState(
//      themeData:ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      name: "Livesxu + 第一种写法"
//  ));

//  //  2.直接指定方法reducer，还是判断action的类型
//  Store store = Store<AppState>(reducer,initialState: new AppState(
//      themeData:ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      name: "Livesxu + 第二种写法"
//  ));

//  3.reducer组装，action对应了指定的reducer返回
  Store store = Store<AppState>(appReducer,initialState: new AppState(
      themeData:ThemeData(
        primarySwatch: Colors.blue,
      ),
      name: "Livesxu + 第三种写法"
  ),middleware: appMiddleware
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child:StoreBuilder<AppState>(builder: (BuildContext buildContext,Store store){
          return  MaterialApp(
              title: 'Flutter Demo',
              theme: store.state.themeData,
              home: MyHomePage(title: 'Flutter Demo Home Page'),
          );
        })
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: StoreBuilder<AppState>(builder: (_,Store store){
        return Center(
          child: Text(store.state.name),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => FirstPage()));
        },
        child: Icon(Icons.navigate_next),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
