import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class PostStore  extends ChangeNotifier{
  List posts = [];

  handleFetchPosts() async {
    String url = 'http://kld.pythonanywhere.com/ListPost/';
    Response response = await get(url);
    int statusCode = response.statusCode;
    print('statusCode $statusCode');
    if(statusCode < 400){
      String json = response.body;
      var data =jsonDecode(json)['results'] as List;
      print('data $data');
      if(data != null){
         posts = data;
        print('posts $posts');
        notifyListeners();
      }
    }
  }
}