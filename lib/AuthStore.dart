import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthStore  extends ChangeNotifier{
  var user = {
    'username' : '',
    'token': '',
    'user_id':''

  };
  bool successAuth = false;
  final storage = new FlutterSecureStorage();

  handleLogin(phoneNumber,pin) async {

    String url = 'http://kld.pythonanywhere.com/login/';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"username":"$phoneNumber", "password":"$pin"}';
    Response response = await post(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    print(statusCode);
    if (statusCode < 400) {
      String body = response.body;
      print(body);
      var data =jsonDecode(body);
      if(data != null){
        print(data);
        user['username'] = data['username'];
        user['token'] = data['token'];
        notifyListeners();
        setUpUser(data['token']);


      }
    }else{
      successAuth = false;
    }
  }
  handleRegistration(phoneNumber,pin) async {
    // set up POST request arguments

    String url = 'http://kld.pythonanywhere.com/registration/';
    Map<String, String> headers = {"Content-type": "application/json"};
    String json =
        '{"username":"$phoneNumber", "password":"$pin"}';
    Response response = await post(url, headers: headers, body: json);
    int statusCode = response.statusCode;
    print(statusCode);
    if (statusCode  < 400) {
      String body = response.body;
      print(body);
      var data =jsonDecode(body);
      if(data != null){
        print(data);
        user['username'] = data['username'];
        user['token'] = data['token'];
        notifyListeners();
        setUpUser(data['token']);

      }
    }else{
      successAuth = false;
    }
  }

  logoutUser() async {
    setUpUser(null);

  }

  createFCMDevice(user,username) async {
    String tokenUser = await storage.read(key: 'token');

    final FirebaseMessaging _firebaseMessagin = FirebaseMessaging();

    var token = await _firebaseMessagin.getToken();
    print('This is FCM Token : $token \n');
    print('user $user');
    print('tokenUser $tokenUser');


    String url = 'http://kld.pythonanywhere.com/fcm/create/';

    Map<String, String> headers = {"Content-type":"application/json",'Authorization': 'JWT $tokenUser'};
    String json =
        '{"name":"$username", "active":"true","device_id":"android","registration_id":"$token", "type":"android", "user":"$user"}';

    Response response = await post(url, headers: headers, body:json);
    int statusCode = response.statusCode;
    print(statusCode);
    print('fcm_response $statusCode');


  }

  setUpUser(receivedToken) async {

    final String token = receivedToken;
    if(token != null){
      final parts = token.split('.');
      final payload = parts[1];
      final String decoded = B64urlEncRfc7515.decodeUtf8(payload);
      var data =jsonDecode(decoded);
      if(data != null){
        print(data);
        user['user_id'] = data['user_id'].toString();
        user['username'] = data['username'].toString();

        successAuth = true;
        await storage.write(key: 'token', value: token);
        createFCMDevice(user['user_id'], user['username']);
        print('successAuth $successAuth');
        notifyListeners();
      }
    }else{
      // Delete all
      await storage.deleteAll();
      successAuth = false;
      user = {
        'username' : '',
        'token': '',
        'user_id':''

      };
    }



  }

  checkForToken() async {
    String token = await storage.read(key: 'token');
    print('token $token');
    if(token != null){final currentTime = new DateTime.now().millisecondsSinceEpoch / 1000;
      final parts = token.split('.');
      final payload = parts[1];
      final String decoded = B64urlEncRfc7515.decodeUtf8(payload);
      final user =jsonDecode(decoded);
      print('user $user');
      if (user['exp'] >= currentTime) {
        setUpUser(token);
      }else{
        setUpUser(null);
      }
    }else{
      setUpUser(null);
    }
  }


}