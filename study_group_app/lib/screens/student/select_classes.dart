import 'package:flutter/material.dart';
// import 'package:flutter/semantics.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:study_group_app/screens/student/calendar.dart';
import 'package:study_group_app/screens/student/courses.dart';

// Stateful course schedule page class.
class CourseSchedulePage extends StatefulWidget {
  CourseSchedulePage({Key key, this.title}) : super(key: key);
  final String title; // final keyword b/c title is in sub widget

  @override
  // Creates the stateful widget HomePage
  _MyCourseFormState createState() => _MyCourseFormState();
}

// Inherits from CourseSchedulePage above
class _MyCourseFormState extends State<CourseSchedulePage> {
  // Form controllers
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseDayController = TextEditingController();
  TextEditingController courseTimeController = TextEditingController();

  // Form data
  // DateTime _dateTime;

  void dispose() {
    courseNameController.dispose();
    courseDayController.dispose();
    courseTimeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add your Class Schedule'),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      //controller: courseNameController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: "Enter your class name",
                        hintStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    TextFormField(
                        //controller: courseDayController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Enter the Day",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        )),
                    TextFormField(
                        //controller: courseTimeController,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                          hintText: "Enter the Time",
                          hintStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        )),
                    SizedBox(
                      width: 320,
                      child: FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => CourseViewerState()));
                        },
                        child: Text("Submit"),
                        color: Colors.blueAccent,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*
// Inherits from CourseSchedulePage above
class _MyCourseFormState extends State<CourseSchedulePage> {

  // Form controllers
  TextEditingController courseNameController = TextEditingController();
  TextEditingController courseDayController = TextEditingController();
  TextEditingController courseTimeController = TextEditingController();

  // Form data
  DateTime _dateTime;

  void dispose() {
  courseNameController.dispose();
  courseDayController.dispose();
  courseTimeController.dispose();
  super.dispose();
  }


  // Displays the schedule
  void displaySchedule(BuildContext context){
    Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyCoursePageState()
            )
    );
  }

  // Save data from the schedule form to the database
  void saveSchedule() {
    Firestore.instance
        .collection('course_schedule')
        .document('PZ9SBOsMrl2AtHbsrHvR')
        .updateData({
          'course_name':courseNameController.text,
          'course_datetime': _dateTime,
        });
  }
}
*/
