import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';


class News extends StatelessWidget {
  final List _news;

 _getNews() async {
    var url = "https://api.hnpwa.com/v0";
    var httpClient = new HttpClient();

    String result;  
    try {
      var request = await httpClient.getUrl(Uri.parse('$url/news/1.json'));
      var response = await request.close();

      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        var data = JSON.decode(json); 

        result = data;
      }
    } catch(exception) {
      result = "Failed";
    }

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return this._getNews().map((item) {
      new Text(item.title);
    });    
  }

}