// import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String? docId;
  String? token;
  String? name;
  String? avatar;
  String? lastMsg;
  // Timestamp? last_time;
  int? msgNum;
  int? online;

  Message({
    this.docId,
    this.token,
    this.name,
    this.avatar,
    this.lastMsg,
    // this.last_time,
    this.msgNum,
    this.online,
  });
}

class CallMessage {
  String? docId;
  String? token;
  String? name;
  String? avatar;
  String? callTime;
  String? type;
  // Timestamp? last_time;

  CallMessage({
    this.docId,
    this.token,
    this.name,
    this.avatar,
    this.callTime,
    this.type,
    // this.last_time,
  });
}
