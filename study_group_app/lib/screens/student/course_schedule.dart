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

/*
// Stateful course schedule page class.
class CourseSchedulePage extends StatefulWidget {
  CourseSchedulePage({Key key, this.title}) : super(key: key);
  final String title; // final keyword b/c title is in sub widget

  @override
  // Creates the stateful widget HomePage
  @override
  _MyCoursePageState createState() => _MyCoursePageState();
}


// Inherits from CourseSchedulePage above
class _MyCourseFormState extends State<CourseSchedulePage> {
  //DateTime _dateTime;

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

  // Form data
  DateTime _dateTime;

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
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 100.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                      TextFormField (
                          //controller: courseNameController,
                          cursorColor: Colors.black,
                          decoration:InputDecoration(
                            hintText: "Enter your class name",
                            hintStyle:TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          )
                      ),
                      TextFormField (
                        //controller: courseDayController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Enter the Day",
                          hintStyle:TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        )
                      ),
                      TextFormField (
                        //controller: courseTimeController,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: "Enter the Time",
                          hintStyle:TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                        )
                      ),
                      SizedBox (
                        width: 320,
                        child: FlatButton(
                          onPressed: (){
                            //displaySchedule(context);
                          },
                          child: Text("Submit"),
                          color: Colors.blueAccent,
                        ),
                      )
                    ]
                  ,)
                ,)
              ,)
          ],
        ),
    );
  }
}
*/

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