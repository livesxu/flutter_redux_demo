import 'package:flutter/material.dart';
import 'package:flutterappflutterreduxdemo/secondPage.dart';
import 'package:flutterappflutterreduxdemo/state.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("第一页"),
      ),
      body: StoreBuilder<AppState>(builder: (_,Store store){
        return Center(
          child: Text(store.state.name),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => SecondPage()));
        },
        child: Icon(Icons.navigate_next),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
