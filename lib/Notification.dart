import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  String _title ;
  String _body = '';

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _register(){
    _firebaseMessaging.getToken().then((token) => print(token));
  }

  @override
  void initState(){
    super.initState();
    getMessage();
//    _register();
  }

  void getMessage(){
    _firebaseMessaging.configure(
      onMessage: (Map<String,dynamic> message) async{
        print('onMessage $message');
        setState(() {
          _title = message["notification"]["title"];
          _body = message["notification"]["body"];

        });
      },
      onResume: (Map<String,dynamic> message) async{
        print('onResum $message');
        setState(() {
          _title = message["notification"]["title"];
          _body = message["notification"]["body"];
        });
      },
      onLaunch: (Map<String,dynamic> message) async{
        print('onLaunch $message');
        setState(() {
          _title = message["notification"]["title"];
          _body = message["notification"]["body"];
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorDark,
        title: Text('Notification',style: TextStyle(
            color: Colors.white
        ),),
      ),
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
             ListTile(
                leading: Icon(Icons.notifications),
                title: Text('title: $_title'),
                subtitle: Text("body: $_body"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

