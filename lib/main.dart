import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
import 'news.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Hacker News'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _news = [];

  @override
  Widget build(BuildContext context) {
   
    
    _newsText(item) {
      _news.map((item) {
        new Text(item.title);
      });
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView.builder(
        itemCount: _news.length,
        itemBuilder: (context, index) {
          Map item = _news[index];

          new News();
        },
      ),


      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.list),
            title: new Text('News'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.work),
            title: new Text('Jobs')
          )
        ],
      )
    );
  }
}
