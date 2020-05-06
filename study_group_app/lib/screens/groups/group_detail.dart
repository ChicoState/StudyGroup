import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:study_group_app/models/message.dart';
import 'package:study_group_app/models/user.dart';
import 'package:study_group_app/screens/groups/group_message.dart';
import 'package:study_group_app/services/user_service.dart';

import '../../models/groups.dart';
import '../../services/message_service.dart';

class GroupDetail extends StatefulWidget {
  final Group group;
  final Color bgColor;
  final Color textColor;

  @override
  _GroupDetailState createState() => _GroupDetailState();

  GroupDetail({this.group, this.bgColor, this.textColor});
}

class _GroupDetailState extends State<GroupDetail> {
  Container aboutPage() {
    return Container(
        constraints: BoxConstraints.expand(),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: ListView(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14.0),
              child: Image.asset('images/pic.png'),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding:EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.0),
              color: Colors.white,
            ),
            child: Container (
              child: Column(
                children: <Widget> [
                  Text(
                    'DAY OF SESSION:  ${widget.group.day}\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'TIME OF SESSION: ${widget.group.startTime} - ${widget.group.endTime}\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'COURSE ID: ${widget.group.id}\n',
                     style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'MAX MEMBERS: ${widget.group.maxMembers}\n',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )
                ]
              )
            ),
        ),
      ]
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<List<Message>>.value(
            value: MessageService(groupId: widget.group.id).groupMessages),
        StreamProvider<User>.value(value: UserService().userData)
      ],
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('${widget.group.name}'),
              bottom: TabBar(tabs: [
                Tab(text: 'About'),
                Tab(text: 'Discussion'),
              ]),
            ),
            body: TabBarView(children: [
              aboutPage(),
              GroupMessage(groupId: widget.group.id)
            ],
            ),
            backgroundColor: Color(0xFF98c1d9),
          ),
        ),
      ),
    );
  }
}

cardText(String str, Color textColor) => Row(
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
