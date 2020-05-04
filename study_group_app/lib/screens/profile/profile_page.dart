import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_group_app/models/user.dart';
import 'package:study_group_app/screens/student/courses.dart';
import 'package:study_group_app/screens/student/select_classes.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF80CBC4),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 50.0,),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Container(
                height: 125.0,
                width: 125.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(62.5),
                  border: Border.all(
                    width: 3,
                    color: Colors.white10
                  ),
                  image: DecorationImage(
                    // Possibly change NetworkImage to user-customizable AssetImage
                    image: NetworkImage('http://barrysforhair.com/wp-content/uploads/2017/11/default_photo.jpeg'),
                    fit: BoxFit.cover,
                  )
                ),
              ),

              SizedBox(height: 25.0,),

              // Retrieve username from Firestore
              Text('Asheela Magwili',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),

              SizedBox(height: 20.0,),

              // Default school
              Text('California State University, Chico',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),

              // View classes
              Container(
                padding: EdgeInsets.symmetric(vertical: 17),
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    'CLASSES',
                    style: TextStyle(
                      color: Color(0xFF80CBC4),
                      letterSpacing: 1.5,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

            ]
          )
        ],
      ),
    );
  }
}