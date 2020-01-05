import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  String _email;
  String _password;
  String _displayName;
  bool _obsecure = false;
  @override
  // create custom logo widget
  Widget logo() {
    return Center(
        child: Padding(
          padding: EdgeInsets.only(top: 120),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 240,
            child: Stack(
              children: <Widget>[
                Positioned(
                    child: Container(
                      child: Align(
                        child: Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          width: 150,
                          height: 150,
                        ),
                        alignment: Alignment.center,
                      ),
                      height: 154,
                    )),
                Positioned(
                  child: Container(
                      height: 154,
                      width: MediaQuery.of(context).size.width,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "GOV",
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                      )),
                ),
                Positioned(
                  width: 60,
                  height: 60,
                  top: 140,
                  left: 260,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                ),
                Positioned(
                  width: 30,
                  height: 30,
                  top: 200,
                  left: 230,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding:false ,
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColorDark,
      body:Column(
        children: <Widget>[
          logo(),
      RaisedButton(
        highlightElevation: 0.0,
        splashColor: Colors.white,
        highlightColor: Colors.deepOrange,
        elevation: 0.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        child: Text(
         'Login',
          style: TextStyle(
              fontWeight: FontWeight.bold, color:Theme.of(context).primaryColorDark, fontSize: 20),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/login');
         print('login');
        },
      ),
          OutlineButton(
            highlightedBorderColor: Colors.white,
            borderSide: BorderSide(color: Colors.white, width: 2.0),
            highlightElevation: 0.0,
            splashColor: Colors.white,
            highlightColor: Theme.of(context).primaryColorDark,
            color: Theme.of(context).primaryColorDark,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
            ),
            child: Text("REGISTER",style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20),),
            onPressed: () {   Navigator.pushNamed(context, '/register');
            },
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
    