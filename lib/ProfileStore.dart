import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';
class ProfileStore  extends ChangeNotifier{
  //Variables
  var userProfile = {'id':'','name' : '', 'nationality': '','civilID' : '','date_of_birth' : ''};


  updateUserProfile(profileID,name,nationality,civilID,dateOfBirth) async{
    print('$name $nationality $civilID $dateOfBirth');
    String url = 'http://kld.pythonanywhere.com/updateProfile/$profileID/';
    Map<String, String> headers = {"Content-type":"application/json"};
    String json = '{"name":"$name", "nationality": "$nationality","civilID": "$civilID","date_of_birth": "$dateOfBirth"}';// make PUT request
    Response response = await put(url, headers: headers, body: json);
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
    String url = 'http://kld.pythonanywhere.com/userProfile/$userID';
    Response response = await get(url);
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
