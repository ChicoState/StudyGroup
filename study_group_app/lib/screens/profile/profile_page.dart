import 'package:flutter/material.dart';
import 'package:study_group_app/screens/profile/settings_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Transparent appbar for settings
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.more_vert, size: 40.0), 
            onPressed: () {_navigateToSettings(context);},
          )
        ],
      ), 
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
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey.shade300,
                  child: FaIcon(
                    FontAwesomeIcons.solidUser,
                    size: 90, 
                    color: Colors.white
                  ),
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
    
  void _navigateToSettings(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileSettingsPage()));
  }
  
}