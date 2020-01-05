import 'package:flutter/material.dart';
import 'package:my_awesome_app/AuthStore.dart';
import 'package:my_awesome_app/EditProfile.dart';
import 'package:provider/provider.dart';
import 'package:my_awesome_app/ProfileStore.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 0)).then((value) {
      final AuthStore authStore = Provider.of<AuthStore>(context,listen: false);
      Provider.of<ProfileStore>(context, listen: false).fetchUserProfile(authStore.user['user_id']);
    });

  }
  @override
  Widget build(BuildContext context) {
   final ProfileStore profileStore = Provider.of<ProfileStore>(context);
//   profileStore.fetchUserProfile(3);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColorDark,
          title: Text('Profile' ,style: TextStyle(
              color: Colors.white
          ),),

          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              tooltip: 'Show Snackbar',
              onPressed: () {
                print('omg');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProfile()
                    )
                );
              },
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Text(
                  'Full Name',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ),
              Card(
                  color: Colors.grey[200],
                  margin:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    title: Text(
                      profileStore.userProfile['name'],
                      style: TextStyle(color: Colors.grey[900], fontSize: 15.0),
                    ),
                  )),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Text(
                  'nationality',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ),
              Card(
                  color: Colors.grey[200],
                  margin:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    title: Text(
                        profileStore.userProfile['nationality'],
                      style: TextStyle(color: Colors.grey[900], fontSize: 15.0),
                    ),
                  )),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Text(
                  'civilID',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ),
              Card(
                  color: Colors.grey[200],
                  margin:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    title: Text(
                      profileStore.userProfile['civilID'],
                      style: TextStyle(color: Colors.grey[900], fontSize: 15.0),
                    ),
                  )),
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Text(
                  'dateOfBirth',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
              ),
              Card(
                  color: Colors.grey[200],
                  margin:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    title: Text(
                        profileStore.userProfile['date_of_birth'],
                      style: TextStyle(color: Colors.grey[900], fontSize: 15.0),
                    ),
                  )),
//              FloatingActionButton(
//                backgroundColor: Colors.red,
//                onPressed: () {
//                  ndleFetchProfile();
//                },
//              )
              Expanded(
                child: Align(
                  child: ClipPath(
                    child: Container(
                      color:  Theme.of(context).primaryColorDark,
                      height: 300,
                    ),
                    clipper: BottomWaveClipper(),
                  ),
                  alignment: Alignment.bottomCenter,
                ),
              )
            ],
          ),
        ),
      ),
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