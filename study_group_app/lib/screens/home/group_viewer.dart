import 'package:flutter/material.dart';
import '../../models/groups.dart';

class GroupView extends StatefulWidget {
  GroupView({Key key}) : super(key: key);

  _GroupState createState() => _GroupState();
}

class _GroupState extends State<GroupView> {
  // List of groups to be populated on initState
  List groups;

  @override
  void initState() {
    // Get the current user's groups, currently hardcoded to be 2
    groups = GroupProvider.instance.getGroupsById(2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  Expanded(child: Text(group.timeBlock)),
                  Expanded(
                      child: Text(
                          'Members: ${group.members}/${group.maxMembers}')),
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
              onTap: () {},
              child: groupCardContent(group),
            ),
          ),
        );

    // Handles the scrolling behavior and bundled up Widgets to return to caller
    return Container(
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
//        shrinkWrap: true,
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
