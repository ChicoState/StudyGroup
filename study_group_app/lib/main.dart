import 'package:flutter/material.dart';
import 'package:study_group_app/screens/wrapper.dart';
import 'package:study_group_app/services/auth.dart';
import 'package:study_group_app/theme/style.dart';
import 'package:study_group_app/screens/student/course_schedule.dart';
import 'package:study_group_app/screens/student/select_classes.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Buddy',
      // Importing from theme/style.dart
      theme: appTheme(),
      // Sets the home page by calling HomePage and passing in title set above
      home: Wrapper(title: 'Study Buddy App'), // Placeholder title for now
      //home: CourseSchedulePage(title: 'My Course Schedule'),
      routes: <String, WidgetBuilder> {
        "/select-classes": (BuildContext context) => CourseSchedulePage()}
    );
  }
}




