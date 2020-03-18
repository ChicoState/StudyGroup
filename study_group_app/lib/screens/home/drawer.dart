import 'package:flutter/material.dart';
import 'package:study_group_app/services/auth.dart';

final Auth _auth = Auth();

// Separate the drawer into this class so it can be called from anywhere
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Returns a Drawer that can be added to any Scaffold drawer
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        // Further expanding objects held in the drawer
        children: <Widget>[
          // Finally at setting first item, This is the big colored chunk
          // with the header text in it in the upper half of drawer
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor, // from style.dart
            ),
            child: Text(
              'Study Groups',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
          ),
          // Now at the bottom half of the drawer
          // ListTiles are fixed height rows that contain text and an icon
          ListTile(
            leading: Icon(Icons.class_),
            title: Text('Classes'),
            onTap: (){
              Navigator.of(context).pushNamed("/select-classes");
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Groups'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Logout'),
            onTap: _auth.logOut,
          ),
        ],
      ),
    );
  }
}
