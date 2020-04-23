import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_group_app/models/groups.dart';

class GroupProvider {
  String userUid;

  GroupProvider({this.userUid});
  final CollectionReference _groupCollection =
      Firestore.instance.collection('groups');

  // Maps the snapshots from Firebase to a list of Groups
  List<Group> _grpFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Group.fromMap(doc.data);
    }).toList();
  }

  // Provides the stream of Group data to the app
  Stream<List<Group>> get groupData {
    return _groupCollection
        .where('memberIds', arrayContains: userUid)
        .snapshots()
        .map(_grpFromSnapshot);
  }

  Future createGroup(Group newGrp) async {
    try {
      // Adds a new document to the groups collection
      // MemberIds array is created with the current user's uid
      DocumentReference result = await _groupCollection.add({
        "name": newGrp.name,
        "memberIds": FieldValue.arrayUnion([userUid]),
        "maxMembers": newGrp.maxMembers,
        "day": newGrp.day,
        "startTime": newGrp.startTime,
        "endTime": newGrp.endTime,
        "location": newGrp.location,
      });
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future updateGroupMember(String uid, String memberId) async {
    try {
      await _groupCollection.document(uid).setData({
        'MemberIds': FieldValue.arrayUnion([memberId])
      }, merge: true);
    } catch (e) {
      print(e);
      return null;
    }
  }
}
