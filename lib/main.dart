import 'package:flutter/material.dart';
import 'news.dart';
import 'api.dart';


void main() {
  runApp(new MyApp());
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Hacker News Clone',
      theme: new ThemeData(
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
  List _news;

  getNews() async {
    var result = await new Api().getNews();

    this.setState(() {
      _news = result;
    });
  }

  @override
  void initState() {
    this.getNews();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(
        children: [
          new Flexible(
            child: new News(_news)
          )
        ]
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
      ),
    );
  }
}
