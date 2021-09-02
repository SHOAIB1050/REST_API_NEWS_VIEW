import 'dart:convert';
import 'newsinfo.dart';
import 'package:flutter_app/string.dart';
import 'package:http/http.dart' as http;
class API_Manager {
  Future <Welcome> getNews() async {
    var clint = http.Client();
    var newsmodel=null;
  try{

  var response = await clint.get(string.news_url);
  if (response.statusCode == 200) {
    var jsonString = response.body;
    var jsonMap = json.decode(jsonString);
    newsmodel = Welcome.fromJson(jsonMap);

  }
}catch(Exception){
    return newsmodel;
    }
    return newsmodel;
  }
}