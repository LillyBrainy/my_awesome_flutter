import 'package:flutter/material.dart';
import 'package:my_awesome_app/AuthStore.dart';
import 'package:my_awesome_app/ProfileStore.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final fullName = TextEditingController();
  final nationality = TextEditingController();
  final civilID = TextEditingController();
  final dateOfBirth = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ProfileStore profileStore = Provider.of<ProfileStore>(context);
    final AuthStore authStore = Provider.of<AuthStore>(context);
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text('Edit Profile'),
         backgroundColor:  Theme.of(context).primaryColorDark,
          actions: <Widget>[
            FlatButton(
              textColor: Colors.white,
              onPressed: () async {
              await profileStore.updateUserProfile(profileStore.userProfile['id'] ,fullName.text,nationality.text,civilID.text,dateOfBirth.text);
              Navigator.pop(context);
              },
              child: Text('Save'),
              shape: CircleBorder(side:BorderSide(color: Colors.transparent)),


            )
          ],
          leading: IconButton(
              icon:Icon(Icons.arrow_back ) ,
              onPressed: (){
                Navigator.pop(context);
              }),
        ),
        body: Column(
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
                  title:  TextField(

                    controller:fullName ,
                    decoration:  InputDecoration(hintText: profileStore.userProfile['name'], border:InputBorder.none),
                  ),
                )),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: Text(
                'Nationality',
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
                  title:  TextField(
                    controller:nationality ,

                    decoration:  InputDecoration(hintText:profileStore.userProfile['nationality'], border: InputBorder.none),
                  ),
//
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
                  title:   TextField(
                    controller: civilID,
                    decoration:  InputDecoration(hintText: profileStore.userProfile['civilID'], border:InputBorder.none),
                  ),
//
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
                  title:   TextField(
                      controller: dateOfBirth,
                      decoration:  InputDecoration(hintText: profileStore.userProfile['date_of_birth'], border:InputBorder.none)
                  ),
//
                )),


          ],

        ),
      ),


    );
  }
}

