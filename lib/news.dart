import 'package:flutter/material.dart';

class News extends StatelessWidget {
  final List _news;

  News(this._news);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: _news == null ? 0 : _news.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: new Padding(
            padding: new EdgeInsets.all(20.0),
            child: new Text(_news[index]['title'])
          )
        );
      },
    );
  }

}