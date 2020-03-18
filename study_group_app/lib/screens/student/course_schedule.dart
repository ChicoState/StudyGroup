/* USER INPUT FOR COURSE SCHEDULE 
    A form and view for users to input their current school schedule
    for the semester or quarter. It will display the school time
    slots in a week view.
*/

import 'package:calendar_strip/calendar_strip.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


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
          )
      ),
    );
  }

  onSelect(data) {
      return Container(
        child: SfCalendar(
          view: CalendarView.day,
          //dataSource: MeetingDataSource(_getDataSource()),
          timeSlotViewSettings: TimeSlotViewSettings(
            timeTextStyle: TextStyle(color: Colors.black),
            timeRulerSize: 100,
            timeInterval: Duration(hours: 1),
          ),
        ),
      );
  }
}