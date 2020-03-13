// This file is mainly serving as static data for now. Will update to integrate
// Firebase data when that is setup
class Group {
  final int id;
  final String name;
  final int members;
  final String meetDay;
  final String timeBlock;
  final int maxMembers;

  Group(
      {this.id,
      this.name,
      this.members,
      this.meetDay,
      this.timeBlock,
      this.maxMembers});
}

class UserStudyGroup {
  final int studyGrpId;
  final int userId;

  UserStudyGroup(this.studyGrpId, this.userId);
}

class GroupProvider {
  List<Group> _groups = List<Group>();
  List<UserStudyGroup> _userGroups = List<UserStudyGroup>();

  GroupProvider._() {
    if (_groups.isEmpty) {
      _groups.add(Group(
          id: 0,
          name: 'Lazer Kitties',
          members: 4,
          meetDay: 'Monday',
          timeBlock: '3-5pm',
          maxMembers: 4));
      _groups.add(Group(
          id: 1,
          name: 'Best Group',
          members: 3,
          meetDay: 'Wednesday',
          timeBlock: '2-3pm',
          maxMembers: 4));
      _groups.add(Group(
          id: 2,
          name: 'Annoying People',
          members: 2,
          meetDay: 'Tuesday',
          timeBlock: '4-5pm',
          maxMembers: 4));
      _groups.add(Group(
          id: 3,
          name: 'Plant club',
          members: 4,
          meetDay: 'Tuesday',
          timeBlock: '5-8pm',
          maxMembers: 8));
      _groups.add(Group(
          id: 4,
          name: '...some other name',
          members: 3,
          meetDay: 'Sat',
          timeBlock: '5-8pm',
          maxMembers: 4));
      _groups.add(Group(
          id: 5,
          name: 'too many groups',
          members: 2,
          meetDay: 'Friday',
          timeBlock: '5-8pm',
          maxMembers: 2));
      _groups.add(Group(
          id: 6,
          name: 'Assholes Anonymous',
          members: 2,
          meetDay: 'Friday',
          timeBlock: '5-8pm',
          maxMembers: 2));
      _groups.add(Group(
          id: 7,
          name: 'Bottom Bitch',
          members: 2,
          meetDay: 'Friday',
          timeBlock: '5-8pm',
          maxMembers: 3));
    }
    // UserStudyGroup(studyGrpId, userId)
    if (_userGroups.isEmpty) {
      // Group 0
      _userGroups.add(UserStudyGroup(0, 0));
      _userGroups.add(UserStudyGroup(0, 1));
      _userGroups.add(UserStudyGroup(0, 2));
      _userGroups.add(UserStudyGroup(0, 3));

      // Group 1
      _userGroups.add(UserStudyGroup(1, 1));
      _userGroups.add(UserStudyGroup(1, 2));
      _userGroups.add(UserStudyGroup(1, 4));

      // Group 2
      _userGroups.add(UserStudyGroup(2, 0));
      _userGroups.add(UserStudyGroup(2, 2));

      _userGroups.add(UserStudyGroup(3, 0));
      _userGroups.add(UserStudyGroup(3, 2));

      _userGroups.add(UserStudyGroup(4, 0));
      _userGroups.add(UserStudyGroup(4, 2));

      _userGroups.add(UserStudyGroup(5, 2));

      _userGroups.add(UserStudyGroup(6, 2));

      _userGroups.add(UserStudyGroup(7, 2));
    }
  }

  // Singleton instance that will be used outside of this class
  static final GroupProvider instance = GroupProvider._();

  List<Group> getGroupsById(int userId) {
    List<Group> grpList = List<Group>();
    List<UserStudyGroup> userGroups = getUserGroups(userId);
    for (var userGrp in userGroups) {
      for (var grp in _groups) {
        if (userGrp.studyGrpId == grp.id) {
          grpList.add(grp);
        }
      }
    }
    return grpList;
  }

  List<UserStudyGroup> getUserGroups(int usrId) {
    List<UserStudyGroup> userGroups = List<UserStudyGroup>();
    for (var userGrp in _userGroups) {
      if (userGrp.userId == usrId) {
        userGroups.add(userGrp);
      }
    }
    return userGroups;
  }
}
