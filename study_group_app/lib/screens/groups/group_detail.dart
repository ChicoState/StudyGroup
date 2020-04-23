import 'package:flutter/material.dart';
import 'package:study_group_app/models/groups.dart';

class GroupDetail extends StatelessWidget {
  final Group group;
  final Color bgColor;
  final Color textColor;

  Container aboutPage() => Container(
      constraints: BoxConstraints.expand(),
      color: bgColor,
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 32.0),
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              child: Image.network(
                'https://www.healthcareisrael.com/images/services/students-ema-care.jpg',
                fit: BoxFit.cover,
                height: 200.0,
              ),
              constraints: BoxConstraints.expand(height: 200.0),
            ),
            Container(
              margin: EdgeInsets.only(top: 110.0),
              height: 110.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.transparent,
                    bgColor,
                  ],
                  stops: [0.0, 0.9],
                  begin: FractionalOffset(0.0, 0.0),
                  end: FractionalOffset(0.0, 1.0),
                ),
              ),
            ),
          ]),
          Container(
            child: Column(
              children: <Widget>[
                cardText('Day of session:'.toUpperCase(), textColor),
                cardText('${group.day}\n', textColor),
                cardText('Time of session:'.toUpperCase(), textColor),
                cardText('${group.startTime} - ${group.endTime}\n', textColor),
                cardText('Course ID:'.toUpperCase(), textColor),
                cardText('${group.id}\n', textColor),
                cardText('Max Members:'.toUpperCase(), textColor),
                cardText('${group.maxMembers}\n', textColor),
              ],
            ),
          ),
        ],
      ));

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('${group.name}'),
          bottom: TabBar(tabs: [
            Tab(text: 'About'),
            Tab(text: 'Discussion'),
          ]),
        ),
        body: TabBarView(children: [aboutPage(), aboutPage()]),
      ),
    );
  }

  GroupDetail({this.group, this.bgColor, this.textColor});
}

Row cardText(String str, Color textColor) => Row(
      children: <Widget>[
        Expanded(
          child: Align(
            child: Text(str,
                style: TextStyle(
                  fontSize: 20,
                  color: textColor,
                )),
          ),
        )
      ],
    );
