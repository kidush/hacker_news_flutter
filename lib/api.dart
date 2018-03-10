import 'dart:io';
import 'dart:convert';

class Api {
  getNews() async {
    var url = "https://api.hnpwa.com/v0";
    var httpClient = new HttpClient();

    var result;  
    try {
      var request = await httpClient.getUrl(Uri.parse('$url/news/1.json'));
      var response = await request.close();

      var json = await response.transform(UTF8.decoder).join();
      var data = JSON.decode(json); 

      result = data;
    } catch(exception) {
      result = "Failed";
    }

    return result;
  }
}