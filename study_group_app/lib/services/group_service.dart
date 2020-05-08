import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_group_app/models/groups.dart';

class GroupService {
  String userUid;

  GroupService({this.userUid});
  final CollectionReference _groupCollection =
      Firestore.instance.collection('groups');

  // Maps the snapshots from Firebase to a list of Groups
  List<Group> _grpFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Group.fromFirestore(doc);
    }).toList();
  }

  // Provides the stream of Group data to the app
  Stream<List<Group>> get groupData {
    return _groupCollection
        .where('memberIds', arrayContains: userUid)
        .snapshots()
        .map(_grpFromSnapshot);
  }

  /// Create new group in Firebase
  Future createGroup(Group newGrp) async {
    try {
      // Adds a new document to the groups collection
      // MemberIds array is created with the current user's uid
      var result = await _groupCollection.add({
        'name': newGrp.name,
        'memberIds': FieldValue.arrayUnion([userUid]),
        'maxMembers': newGrp.maxMembers,
        'day': newGrp.day,
        'startTime': newGrp.startTime,
        'endTime': newGrp.endTime,
        'location': newGrp.location,
      });
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }

  /// Searches for a group by name
  Future<List<Group>> findGroup(String name) async {
    var snapshots = await _groupCollection
        .where('name', isGreaterThanOrEqualTo: name)
        .getDocuments();
    return snapshots.documents
        .map((snap) => Group.fromFirestore(snap))
        .toList();
  }

  /// Updates a group with the specified member
  Future updateGroupMember(String groupId, String memberId) async {
    try {
      await _groupCollection.document(groupId).setData({
        'memberIds': FieldValue.arrayUnion([memberId])
      }, merge: true);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
