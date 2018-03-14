import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';


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

                new ButtonBar(
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(Icons.web),
                      tooltip: 'Open Here',
                      onPressed: () {
                        this.goToURL(_news[index]['url']);
                      },
                    ),
                    new IconButton(
                      icon: new Icon(Icons.share),
                      tooltip: 'share',
                      onPressed: () {
                        share(_news[index]['url']);
                      },
                    ),
                  ],
                ),
              ]
            ),
          )
        );
      },
    );
  }

}