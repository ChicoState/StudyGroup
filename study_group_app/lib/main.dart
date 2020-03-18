import 'package:flutter/material.dart';
import 'package:study_group_app/services/auth.dart';
import 'package:study_group_app/theme/style.dart';
import 'package:study_group_app/screens/student/select_classes.dart';
import 'package:study_group_app/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:study_group_app/models/user.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Auth().getUser,
      child: MaterialApp(
          title: 'Study Buddy',
          // Importing from theme/style.dart
          theme: appTheme(),
          // Sets the home page by calling HomePage and passing in title set above
          //home: CourseSchedulePage(title: 'My Course Schedule'),
          home: Wrapper(title: 'Study Buddy'),
          routes: <String, WidgetBuilder>{
            "/select-classes": (BuildContext context) => new CourseSchedulePage(),
          }),
    );
  }
}


