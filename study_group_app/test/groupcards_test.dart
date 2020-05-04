import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:study_group_app/screens/groups/add_group.dart';
import 'package:study_group_app/screens/home/home.dart';
//import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';

void main () {

  group( 'Creating new group study session.', () {

    // Tests group card
    test('New group study session appear as card on home page', (){
      HomePage test_homepage = HomePage();
    });
  });
}
/*
void main() {
  group( 'Creating new group study session.', () {

    // Tests group card
    test('New group study session appear as card on home page', (){
      /* 1. Difficult to test because group depends on userID
       *
       */

      // Create the testing group
      Group newTestGroup = Group(
        name: "Testing",
        day: "Monday",
        startTime: "12:00",
        endTime: "1:00",
        maxMembers: 5,
        location: "Library",
      );

      // Save to Firebase
      final _db = GroupProvider();
      _db.userUid = "12345";
      dynamic result = _db.createGroup(newTestGroup);
      _db.createGroup(newTestGroup);

      // Read new card
      final Group testGroups;
      final cards = GroupView();

      // Set expectations
      expect(cards.);
    });
  });
}
*/