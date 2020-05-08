// This file is mainly serving as static data for now. Will update to integrate
// Firebase data when that is setup
import 'package:cloud_firestore/cloud_firestore.dart';

class Group {
  final String id;
  final String name;
  List<dynamic> memberIds;
  final String day;
  final String startTime;
  final String endTime;
  final int maxMembers;
  final String location;

  Group(
      {this.id,
      this.name,
      this.memberIds,
      this.day,
      this.startTime,
      this.endTime,
      this.maxMembers,
      this.location});

  factory Group.fromFirestore(DocumentSnapshot doc) {
    Map map = doc.data;
    return Group(
      id: doc.documentID,
      name: map['name'] ?? '',
      memberIds: map['memberIds'] as List ?? [],
      maxMembers: map['maxMembers'] ?? '',
      day: map['day'] ?? '',
      startTime: map['startTime'] ?? '',
      endTime: map['endTime'] ?? '',
      location: map['location'] ?? '',
    );
  }
}
