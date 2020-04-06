import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:study_group_app/screens/groups/group_detail.dart';
import 'package:study_group_app/services/group_provider.dart';
// import 'package:study_group_app/models/user.dart';
// import 'package:provider/provider.dart';
import 'package:study_group_app/models/groups.dart';

class GroupView extends StatefulWidget {
  GroupView({Key key, this.userId}) : super(key: key);
  final String userId;
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<GroupView> {
  // List of groups to be populated on initState
  List<Group> groups = List<Group>();

  @override
  void initState() {
    // Get the current user's groups, currently hardcoded to be 2
    GroupProvider.instance.getGroups(widget.userId).then((QuerySnapshot docs) {
      if (docs.documents.isNotEmpty) {
        docs.documents.forEach((doc) => groups.add(Group.fromMap(doc.data)));
        // groups.add(Group.fromMap(docs.documents[0].data));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final user_data = Provider.of<UserData>(context);
    // Main content of the card, Sets placement and content of inner objects
    Container groupCardContent(Group group) => Container(
          margin: EdgeInsets.fromLTRB(50.0, 16.0, 16.0, 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(height: 5.0),

              // Following Widgets are contents of each user's group.
              // TODO Style and design
              Text(group.name),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  height: 1.5,
                  width: 40.0,
                  color: Colors.grey),
              Row(
                children: <Widget>[Expanded(child: Text(group.meetDay))],
              ),
              Row(
                children: <Widget>[
                  Expanded(child: Text(group.startTime)),
                  Expanded(
                    child: Text('Members: ${group.maxMembers}'),
                  ),
                ],
              ),
            ],
          ),
        );

    // Design of outer container, shape, height, on tap functions, ect
    Container groupCard(Group group) => Container(
          height: 120.0,
          margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Theme.of(context).accentColor,
                blurRadius: 10.0,
                offset: Offset(0.0, 10.0),
              ),
            ],
          ),
          // Wrap InkWell in Material Widget to show the splash effect on tap
          child: Material(
            borderRadius: BorderRadius.circular(8.0),
            color: Theme.of(context).accentColor,
            child: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              // Call the group_detail page to view
              onTap: () {
                // print(user_data.email);
              },

              child: groupCardContent(group),
            ),
          ),
        );

    // Handles the scrolling behavior and bundled up Widgets to return to caller
    return Container(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemCount: groups.length,
        itemBuilder: (BuildContext context, int index) {
          return groupCard(groups[index]);
        },

        // May be a better way to do this, but builds a dividing space between each card
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Theme.of(context).dividerColor,
          );
        },
      ),
    );
  }
}