import 'package:flutter/material.dart';
import 'package:my_awesome_app/HomeFeedPage.dart';
import 'package:my_awesome_app/ProfilePage.dart';
import 'package:my_awesome_app/Notification.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedPage = 0;
final _pageOption = [
  HomeFeedPage(),
  NotificationPage(),
  ProfilePage(),

];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body:_pageOption[_selectedPage] ,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:  Color(0xFFFAFAFA),
          currentIndex: _selectedPage,
          onTap: (int index){
            setState(() {
              _selectedPage = index;
            });
          },
          items:[
            BottomNavigationBarItem(
              icon:Icon(Icons.home),
              title: Text(''),

            ),
                        BottomNavigationBarItem(
                          icon:Icon(Icons.notifications),
                          title: Text(''),),
            BottomNavigationBarItem(
                icon:Icon(Icons.person),
                title: Text('')),

          ]
      ),
    );
  }
  }
