import'package:flutter/material.dart';
import 'package:my_awesome_app/DashboardPage.dart';
import 'package:my_awesome_app/Home.dart';
import 'package:my_awesome_app/Login.dart';
import 'package:provider/provider.dart';
import 'package:my_awesome_app/AuthStore.dart';
class SwitchNav extends StatefulWidget {
  @override
  _SwitchNavState createState() => _SwitchNavState();
}

class _SwitchNavState extends State<SwitchNav> {
//  bool Dashboard = false;
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 0)).then((value) async {
      await Provider.of<AuthStore>(context, listen: false).checkForToken();
      final AuthStore authStore = Provider.of<AuthStore>(context, listen: false);
      print('hey ${authStore.successAuth}');
      if(authStore.successAuth == true){
        Navigator.pushReplacementNamed(context, "/dashboard");
//        Navigator.push(
//            context,
//            MaterialPageRoute(
//                builder: (context) => DashboardPage()
//            )
//        );
      }else{
        Navigator.pushReplacementNamed(context, "/home");
      }
    });}

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
