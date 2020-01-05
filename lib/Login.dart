import'package:flutter/material.dart';
import 'package:my_awesome_app/AuthStore.dart';
import 'package:my_awesome_app/DashboardPage.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneNumber = TextEditingController();
  final pin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthStore authStore = Provider.of<AuthStore>(context);
      return Scaffold(
        backgroundColor: Theme.of(context).primaryColorDark,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Login',style: TextStyle(
            color: Theme.of(context).primaryColorDark
          ),),
          actions: <Widget>[
            FlatButton(
              child: Text('Signin', style: TextStyle(fontSize: 17),),
              textColor: Theme.of(context).primaryColorDark,

              onPressed: () async{
              await authStore.handleLogin(phoneNumber.text, pin.text);
              Navigator.pushReplacementNamed(context, "/dashboard");
              },
            )
          ],

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
              child: TextField(
                controller: phoneNumber,
                obscureText: false,
                style: TextStyle(fontSize: 20, color: Colors.white),
                decoration: InputDecoration(
                    hintStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 17,color: Colors.white70),
                    hintText: 'Phone Number',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color:Colors.white,
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color:Colors.white,
                        width: 3,
                      ),
                    ),
                    prefixIcon: Padding(
                      child: IconTheme(
                          data: IconThemeData(color: Colors.white),
                          child: Icon(Icons.person)
                      ),
                      padding: EdgeInsets.only(left: 30, right: 10),
                    )),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
              child: TextField(
                controller: pin,
                obscureText: true,
                style: TextStyle(fontSize: 20, color: Colors.white),
                decoration: InputDecoration(
                    hintStyle: TextStyle(fontWeight:  FontWeight.normal, fontSize: 17,color: Colors.white70),
                    hintText: 'Enter 4 digits pin',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color:Colors.white,
                        width: 2,
                      ),
                    ),
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color:Colors.white,
                        width: 3,
                      ),
                    ),
                    prefixIcon: Padding(
                      child: IconTheme(
                          data: IconThemeData(color: Colors.white),
                          child: Icon(Icons.linear_scale)
                      ),
                      padding: EdgeInsets.only(left: 30, right: 10),
                    )),
              ),
            ),
            Expanded(
              child: Align(
                child: ClipPath(
                  child: Container(
                    color: Colors.white,
                    height: 300,
                  ),
                  clipper: BottomWaveClipper(),
                ),
                alignment: Alignment.bottomCenter,
              ),
            )
          ],



        )
        ,
      );
  }
}
class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.lineTo(0.0, size.height + 5);
    var secondControlPoint = Offset(size.width - (size.width / 6), size.height);
    var secondEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}