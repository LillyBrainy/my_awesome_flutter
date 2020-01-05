import 'package:flutter/material.dart';
import 'package:my_awesome_app/AuthStore.dart';
import 'package:my_awesome_app/DashboardPage.dart';
import 'package:my_awesome_app/Home.dart';
import 'package:my_awesome_app/Login.dart';
import 'package:my_awesome_app/PostStore.dart';
import 'package:my_awesome_app/ProfileStore.dart';
import 'package:my_awesome_app/SwitchNav.dart';
import 'package:my_awesome_app/registration.dart';
import 'package:provider/provider.dart';

void main(){
  //Note that we will set the DeviceOrientation to Portrait Up
//  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//      .then((_) {
    runApp(new MyApp());
//  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (_) => PostStore()),
      ChangeNotifierProvider(create: (_) => ProfileStore()),
        ChangeNotifierProvider(create: (_) => AuthStore()),
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          hintColor: Color(0xFFC0F0E8),
          primaryColor: Color(0xFF80E1D1),
          canvasColor: Colors.transparent),
//          fontFamily: "Montserrat",
          home: SwitchNav(),
//      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
      '/register': (context) => Registration(),
       '/switchNav': (context) => SwitchNav(),
        '/home': (context) => Home()
      },
    ),
    );
  }
}
