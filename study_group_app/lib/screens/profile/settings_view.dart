import 'package:flutter/material.dart';
import 'package:study_group_app/models/user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileSettingsPage extends StatelessWidget {
  final User user;
  ProfileSettingsPage({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.color,
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            const SizedBox(height: 10.0),

            Container(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onEditingComplete: () {},
                decoration: InputDecoration(
                  hintText: 'Name',
                ),
              )
            ),

            // Edit other user settings
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              margin: const EdgeInsets.fromLTRB(29.0, 8.0, 29.0, 16.0),
              color: Color(0xFF80CBC4),
              child: Column(
                children: <Widget>[  

                  // Edit password
                  ListTile(
                    onTap: () {
                      // Action to edit password in Firebase
                    },
                    title: Text('${user.email}'), // Grab from Firebase
                    leading: Icon(Icons.portrait),
                    trailing: Icon(Icons.edit),
                  ),

                  _divider(),

                  // Edit password
                  ListTile(
                    onTap: () {
                      // Action to edit password in Firebase
                    },
                    title: Text('Change Email'), // Grab from Firebase
                    leading: Icon(Icons.email),
                    trailing: Icon(Icons.edit),
                  ),

                  _divider(),

                  // Edit password
                  ListTile(
                    onTap: () {
                      // Action to edit password in Firebase
                    },
                    title: Text('Change Password'), // Grab from Firebase
                    leading: Icon(Icons.lock_outline),
                    trailing: Icon(Icons.edit),
                  ),
                ]
              ),
            ),
          ],
        )
      ),
    );
  }

  // Styling: Divider between settings
  Container _divider()
  {
    return Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade300,
      margin: const EdgeInsets.symmetric(horizontal: 8.0,),
    );
  }

}