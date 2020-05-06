import 'package:flutter/material.dart';
import 'package:study_group_app/models/models.dart';

class UserTemp {
  final String name;

  UserTemp({this.name});
}

class Message {
  final UserTemp sender;
  final String time;
  final String text;

  Message({this.sender, this.time, this.text});
}

class GroupDetail extends StatefulWidget {
  final Group group;
  final Color bgColor;
  final Color textColor;

  @override
  _GroupDetailState createState() => _GroupDetailState();

  GroupDetail({this.group, this.bgColor, this.textColor});
}

class _GroupDetailState extends State<GroupDetail> {
  List<Message> messages = [
    Message(
        sender: UserTemp(name: 'bill'),
        text: 'I\'m doing great bro!',
        time: '8:50PM'),
    Message(
        sender: UserTemp(name: 'john'),
        text:
            'Greetings feelow class members!? I hope life is going great!How are you?',
        time: '8:50PM'),
    Message(
        sender: UserTemp(name: 'marcus'),
        text: 'Congratulations!',
        time: '8:50PM'),
    Message(
        sender: UserTemp(name: 'john'),
        text: 'So how was the test?',
        time: '8:50PM'),
  ];

  aboutPage() => Container(
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
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.0),
                color: Colors.white,
              ),
              child: Container(
                child: Column(
                  children: <Widget>[
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
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  discussionTab() => Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: ListView.builder(
                reverse: true,
                padding: EdgeInsets.only(top: 15.0),
                physics: BouncingScrollPhysics(),
                itemCount: messages.length,
                itemBuilder: (BuildContext context, int index) {
                  final bool isMe = messages[index].sender.name == 'john';
                  final Color textColor =
                      isMe ? widget.textColor : Colors.black;
                  return buildMessage(
                      messages[index], isMe, widget.bgColor, textColor);
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            height: 70.0,
            color: Colors.white,
            child: Row(
              // TODO: add opening of pictures when clicking photo icon and add
              // insert based on realtime
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.group),
                  iconSize: 25.0,
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    onSubmitted: (message) {
                      setState(
                        () {
                          messages.insert(
                            0,
                            Message(
                                sender: UserTemp(name: 'john'),
                                time: '5:40PM',
                                text: message),
                          );
                        },
                      );
                    },
                    style: TextStyle(fontSize: 15.0),
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 15.0),
                      hintText: 'Enter message here...',
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('${widget.group.name}'),
            bottom: TabBar(
              tabs: [
                Tab(text: 'About'),
                Tab(text: 'Discussion'),
              ],
            ),
          ),
          body: TabBarView(children: [aboutPage(), discussionTab()]),
          backgroundColor: Color(0xFF98c1d9),
        ),
      ),
    );
  }

  buildMessage(Message msg, bool isMe, Color bgColor, Color textColor) =>
      Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(isMe ? 'You said:' : '${msg.sender.name} said:',
                style: TextStyle(
                  fontSize: 10,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                )),
            SizedBox(height: 4.0),
            Text(msg.text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                )),
            SizedBox(height: 8.0),
            Row(
              children: <Widget>[
                Text(
                  '${msg.time}',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
              ],
            )
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        margin: isMe
            ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
            : EdgeInsets.only(top: 8.0, bottom: 8.0, right: 80.0),
        decoration: BoxDecoration(
          color: isMe ? bgColor : Colors.grey,
          borderRadius: isMe
              ? BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  bottomLeft: Radius.circular(15.0))
              : BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0)),
        ),
      );
}
