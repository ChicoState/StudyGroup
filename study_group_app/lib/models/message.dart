class Message {
  final String userEmail;
  final int time;
  final String messageText;
  final String groupId;

  Message({this.userEmail, this.time, this.messageText, this.groupId});

  factory Message.fromMap(Map map) {
    return Message(
      userEmail: map['userEmail'] ?? '',
      time: map['time'] ?? '',
      messageText: map['messageText'] ?? '',
      groupId: map['groupId'] ?? '',
    );
  }
}
