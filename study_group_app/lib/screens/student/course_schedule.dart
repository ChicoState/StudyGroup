/* USER INPUT FOR COURSE SCHEDULE 
    A form and view for users to input their current school schedule
    for the semester or quarter. It will display the school time
    slots in a week view.
*/

import 'package:calendar_strip/calendar_strip.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:study_group_app/screens/student/select_classes.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/src/widgets/container.dart';

 // Displays the given information
class MyCoursePageState extends StatefulWidget {
  
  // Creates the stateful widget HomePage
  @override
  _MyCoursePageState createState() => _MyCoursePageState();
}

class _MyCoursePageState extends State<MyCoursePageState> {
  
  // Calendar display
  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text("My Course Schedule"),
      ),
      body: Container(
          child: CalendarStrip(
              startDate: now,
              endDate: now.add(new Duration(days:60)),
              onDateSelected: onSelect,
            ),
          ),
    );
  }

  /*
  void CalendarStripView()
  {
    var now = new DateTime.now();
    return Container(
          child: Center(
            child: CalendarStrip(
              startDate: now,
              endDate: now.add(new Duration(days:60)),
              onDateSelected: onSelect,
            ),
          )
    );
  }
  */

  

  // List of data to display
  List<course> _getDataSource() {
    var courses = <course>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 22, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    courses.add(
        course('Software Engineering','CSCI430',startTime, endTime));
    return courses;
  }

  // Invokes the day-view when a day is selected on the strip
  onSelect(data) {
      return Container(
        child: SfCalendar(
          view: CalendarView.day,
          dataSource: CourseDataSource(_getDataSource()),
          timeSlotViewSettings: TimeSlotViewSettings(
            timeTextStyle: TextStyle(color: Colors.black),
            timeRulerSize: 100,
            timeInterval: Duration(hours: 1),
          ),
        ),
      );
  }
}

class CourseDataSource extends CalendarDataSource {
  CourseDataSource(List<course> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments[index].start;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments[index].finish;
  }

  @override
  String getName(int index) {
    return appointments[index].courseName;
  }
}

// Temporary data for testing
class course {
  course(this.courseName, this.courseID, this.start, this.finish);

  String courseName;
  String courseID;
  DateTime start;
  DateTime finish;
  
}