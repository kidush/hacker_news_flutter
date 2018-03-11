import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class News extends StatelessWidget {
  final List _news;

  News(this._news);

  goToURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not Launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: _news == null ? 0 : _news.length,
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: new Padding(
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              children: [
                new Text(
                  _news[index]['title'],
                  style: new TextStyle(fontSize: 18.0)
                ),
                new FlatButton(
                  child: new Text('Open Here'),
                  onPressed: () {
                    this.goToURL(_news[index]['url']);
                  },
                )
              ]
            ),
          )         
        );
      },
    );
  }

}