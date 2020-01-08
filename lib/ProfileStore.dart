import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class ProfileStore  extends ChangeNotifier{
  //Variables
  var userProfile = {'id':'','name' : '', 'nationality': '','civilID' : '','date_of_birth' : ''};

  final storage = new FlutterSecureStorage();
  updateUserProfile(profileID,name,nationality,civilID,dateOfBirth) async{
  String tokenUser = await storage.read(key: 'token');
    print('$name $nationality $civilID $dateOfBirth');
    String url = 'http://kld.pythonanywhere.com/updateProfile/$profileID/';
    String json = '{"name":"$name", "nationality": "$nationality","civilID": "$civilID","date_of_birth": "$dateOfBirth"}';// make PUT request
    Response response = await put(url, headers: {HttpHeaders.authorizationHeader:'JWT $tokenUser'}, body: json);
    int statusCode = response.statusCode;
    print(statusCode);
    if(statusCode < 400){
      String body = response.body;
      var data =jsonDecode(body);
      if(data != null){
        print(data);

        userProfile['name'] = data['name'];
        userProfile['nationality'] = data['nationality'];
        userProfile['civilID'] = data['civilID'];
        userProfile['date_of_birth'] = data['date_of_birth'];
        notifyListeners();
      }
    }

  }

  fetchUserProfile(userID) async{
    print(userID);
    String tokenUser = await storage.read(key: 'token');
    print('tokenUser $tokenUser');
    String url = 'http://kld.pythonanywhere.com/userProfile/';
//    Map<String, String> headers = {"Content-type":"application/json,  'Accept': 'application/json','Authorization': 'JWT $tokenUser'"};

    Response response = await get(url, headers: {HttpHeaders.authorizationHeader:'JWT $tokenUser'});
    int statusCode = response.statusCode;
    print('statusCode $statusCode');
    if(statusCode < 400){

      String json = response.body;
      print('json $json');
      var data =jsonDecode(json)[0];
      print('data $data');
      if(data != null){
        userProfile['id'] = data['id'].toString();
        userProfile['name'] = data['name'];
        userProfile['nationality'] = data['nationality'];
        userProfile['civilID'] = data['civilID'];
        userProfile['date_of_birth'] = data['date_of_birth'];
        notifyListeners();
      }
    }

  }



}
