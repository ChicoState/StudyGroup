import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_group_app/screens/groups/add_group.dart';
import 'drawer.dart';
import 'package:study_group_app/models/user.dart';
import 'package:study_group_app/screens/student/select_classes.dart';
import 'package:study_group_app/services/group_provider.dart';
import 'package:study_group_app/screens/groups/group_viewer.dart';
import 'package:study_group_app/models/groups.dart';

// Stateful home page class.
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
// Creates the stateful widget HomePage
  _HomePageState createState() => _HomePageState();
}

// Inherits from HomePage above
class _HomePageState extends State<HomePage> {
  var appBarTitle = "Home";
  int _selectedPage = 0;
  final _pageOptions = [
    GroupView(),
    CreateGroup(),
  ];

  @override
  void initState() {
    super.initState();
  }

  // Main build function, generates the view
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return StreamProvider<List<Group>>.value(
      value: GroupProvider(userUid: user.uid).groupData,
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(appBarTitle),
        ),
        drawer: MainDrawer(),
        body: SafeArea(
          top: false,
          child: IndexedStack(
            index: _selectedPage,
            children: _pageOptions,
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.grey[900],
            primaryColor: Colors.grey[300],
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(title: TextStyle(color: Colors.white)),
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedPage,
            onTap: (int index) {
              setState(() {
                _selectedPage = index;
                appBarTitle = allDestinations[index].title;
              });
            },
            items: allDestinations.map((Destination destination) {
              return BottomNavigationBarItem(
                  icon: Icon(destination.icon), title: Text(destination.title));
            }).toList(),
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

// Bottom navigation bar constructors
class Destination {
  const Destination(this.title, this.icon);
  final String title;
  final IconData icon;
}

const List<Destination> allDestinations = <Destination>[
  Destination('Home', Icons.home),
  // Destination('Profile', Icons.portrait),
  // Destination('Search', Icons.search),
  Destination('Create', Icons.add)
];
