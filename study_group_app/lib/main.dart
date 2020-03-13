import 'package:flutter/material.dart';
import 'package:study_group_app/theme/style.dart';
//import 'package:study_group_app/screens/auth/login.dart';
import 'package:study_group_app/screens/home/home.dart';
import 'package:study_group_app/screens/student/course_schedule.dart';
import 'package:study_group_app/screens/student/select_classes.dart';


//void main() => runApp(MyApp());
// The above code is just a fancy way of doing this. Changed to show that it works
// the same. Anytime you see => notation this is what its actually doing
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Buddy',
      // Importing from theme/style.dart
      theme: appTheme(),
      // Sets the home page by calling HomePage and passing in title set above
      home: HomePage(title: 'Study Buddy App'), // Placeholder title for now
      //home: CourseSchedulePage(title: 'My Course Schedule'),
      routes: <String, WidgetBuilder> {
        "/select-classes": (BuildContext context) => new CourseSchedulePage()}
    );
  }
}




