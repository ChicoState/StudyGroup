/* COURSES: Simply displays what the student's current schedule is.
 * This could be useful for:
 *  - Keeping a history of user's previously classes
 *  - Saving data for study group matching
 *  - For future use, can be moved to instead open from user's profile
 *    as a way for users to see what other users are taking/taken.
 */

import 'package:flutter/material.dart';

class CourseViewerState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('My Courses'),
          bottom: TabBar(tabs: [
            Tab(text: 'CSCI430'),
            Tab(
              text: 'CINS448',
            ),
            Tab(
              text: 'CSCI340',
            ),
          ]),
        ),
        body: TabBarView(children: [
          getContent('Software Engineering'),
          getContent('Computer Security'),
          getContent('Operating Systems'),
        ]),
        persistentFooterButtons: <Widget>[
          RaisedButton(
            onPressed: null,
            color: Colors.blueAccent,
            child: Text('Edit Courses'),
          )
        ],
      ),
    );
  }

  // Gets the content for the course
  Container getContent(String courseID) {
    return Container(
      child: Column(
        children: <Widget>[
          getTitle(courseID),
          getTime(),
          getDescription(),
        ],
      ),
    );
  }

  // Styles and returns a description of the class
  Container getDescription() {
    return Container(
      padding: EdgeInsets.all(15.0),
      alignment: Alignment.topCenter,
      child: Text(
        'Software Engineers will collaborate with entrepreneaurs to create a tech startup.',
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  // Gets the time course session meets
  Container getTime() {
    return Container(
      padding: EdgeInsets.all(15.0),
      alignment: Alignment.topLeft,
      child: Text(
        'Course Meeting Time(s): 11:00am MWF',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Styles the title of each given course
  Container getTitle(String title) {
    return Container(
      padding: EdgeInsets.all(20.0),
      alignment: Alignment.topCenter,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Displays button to edit courses
  Container getButton() {
    return Container(
      child: RaisedButton(
        onPressed: null,
      ),
    );
  }
}
