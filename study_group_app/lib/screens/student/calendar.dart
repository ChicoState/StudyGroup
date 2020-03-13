/* USER INPUT FOR COURSE SCHEDULE 
    A form and view for users to input their current school schedule
    for the semester or quarter. It will display the school time
    slots in a week view.
*/

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:study_group_app/screens/student/select_classes.dart';

// Displays the given information
class MyCalendarPageState extends StatefulWidget {
  
  // Creates the stateful widget HomePage
  @override
  _MyCalendarPageState createState() => _MyCalendarPageState();
}

class _MyCalendarPageState extends State<MyCalendarPageState> {

  // Controllers
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarController: _calendarController,
      locale: 'en_US',
    );
  }
  // Calendar display
  /*
  @override
  Widget build(BuildContext context) {
    var now = new DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: Text("My Course Schedule"),
      ),
      body: Container(
          child: 
          ),
    );
  }*/
}

// Temporary data for testing
class course {
  course(this.courseName, this.courseID, this.start, this.finish);

  String courseName;
  String courseID;
  DateTime start;
  DateTime finish;
  
}

/* ----- Depreciated Code ----- */
/*

import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/semantics.dart';
import 'package:calendar_strip/calendar_strip.dart';
import 'package:flutter/foundation.dart';

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
*/