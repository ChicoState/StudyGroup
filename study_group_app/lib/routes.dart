import 'package:flutter/material.dart';
import 'package:study_group_app/screens/groups/group_detail.dart';
import 'package:study_group_app/screens/student/select_classes.dart';
import 'package:study_group_app/screens/student/courses.dart';
import 'package:study_group_app/screens/groups/group_viewer.dart';
import 'package:study_group_app/screens/wrapper.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Wrapper());
      case '/select-classes':
        return MaterialPageRoute(builder: (_) => CourseSchedulePage());
      case '/group-detail':
        return MaterialPageRoute(builder: (_) => GroupDetail());
      case '/courses':
        return MaterialPageRoute(builder: (_) => CourseViewerState());
      case '/group-viewer':
        return MaterialPageRoute(builder: (_) => GroupView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
