// This file is mainly serving as static data for now. Will update to integrate
// Firebase data when that is setup
class Group {
  final int id;
  final String name;
  var memberIds;
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

  factory Group.fromMap(Map data) {
    return Group(
      name: data['name'] ?? '',
      memberIds: data['memberIds'] ?? '',
      maxMembers: data['maxMembers'] ?? '',
      day: data['day'] ?? '',
      startTime: data['startTime'] ?? '',
      endTime: data['endTime'] ?? '',
      location: data['location'] ?? '',
    );
  }
}
