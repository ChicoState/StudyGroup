import 'package:flutter/material.dart';
import 'package:study_group_app/screens/home/drawer.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

import 'group_viewer.dart';

// Stateful home page class.
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title; // final keyword b/c title is in sub widget

  @override
// Creates the stateful widget HomePage
  _HomePageState createState() => _HomePageState();
}

// Inherits from HomePage above
class _HomePageState extends State<HomePage> {
  @override
  // Main build function, generates the view
  Widget build(BuildContext context) {
    // Scaffold is from MaterialApp. Implements the basic visual layout
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      // Top bar, title is set using widget.title which is passed down from main
      appBar: AppBar(
        title: Text(widget.title),
      ),
      // drawer sets the hamburger menu on the side that pops out
      // its' child is a ListView that holds all the elements held in the drawer
      drawer: MainDrawer(),
      persistentFooterButtons: <Widget>[
        RaisedButton.icon(
          onPressed: () {},
          color: Colors.blueAccent,
          label: Text('Find Group'),
          icon: Icon(Icons.search),
        )
      ],
      body: GroupView(),
    );
  }
}
