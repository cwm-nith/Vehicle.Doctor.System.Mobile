class SyncMessageRequestEntity {
  int? msgid;
  SyncMessageRequestEntity({
    this.msgid,
  });

  Map<String, dynamic> toJson() => {
        "msgid": msgid,
      };
}

class CallRequestEntity {
  String? callType; //1. voice 2. video
  String? toToken;
  String? toName;
  String? toAvatar;
  String? docId;

  CallRequestEntity({
    this.callType,
    this.toToken,
    this.toName,
    this.toAvatar,
    this.docId,
  });

  Map<String, dynamic> toJson() => {
        "callType": callType,
        "toToken": toToken,
        "toName": toName,
        "toAvatar": toAvatar,
        "docId": docId,
      };
}

class CallTokenRequestEntity {
  String? channelName;

  CallTokenRequestEntity({
    this.channelName,
  });

  Map<String, dynamic> toJson() => {
        "channelName": channelName,
      };
}

class ChatRequestEntity {
  String? content;
  String? type;
  String? toToken;

  ChatRequestEntity({
    this.content,
    this.type,
    this.toToken,
  });

  Map<String, dynamic> toJson() => {
        "content": content,
        "type": type,
        "toToken": toToken,
      };
}

class Chat {
  String? fromToken;
  String? toToken;
  int? msgid;
  String? content;
  String? type;
  int? status;
  String? createdAt;

  Chat({
    this.fromToken,
    this.toToken,
    this.msgid,
    this.content,
    this.type,
    this.status,
    this.createdAt,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        fromToken: json["fromToken"],
        toToken: json["toToken"],
        msgid: json["msgid"],
        content: json["content"],
        type: json["type"],
        status: json["status"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "fromToken": fromToken,
        "toToken": toToken,
        "msgid": msgid,
        "content": content,
        "type": type,
        "status": status,
        "createdAt": createdAt,
      };
}

class MsgListcontent {
  int? msgid;
  String? fromToken;
  String? fromName;
  String? fromAvatar;
  String? toToken;
  String? content;
  String? type;
  int? status;
  String? createdAt;

  MsgListcontent({
    this.msgid,
    this.fromToken,
    this.fromName,
    this.fromAvatar,
    this.toToken,
    this.content,
    this.type,
    this.status,
    this.createdAt,
  });

  factory MsgListcontent.fromJson(Map<String, dynamic> json) => MsgListcontent(
        fromToken: json["fromToken"],
        fromAvatar: json["fromAvatar"],
        fromName: json["fromName"],
        toToken: json["toToken"],
        msgid: json["msgid"],
        content: json["content"],
        type: json["type"],
        status: json["status"],
        createdAt: json["createdAt"],
      );

  Map<String, dynamic> toJson() => {
        "fromToken": fromToken,
        "fromName": fromName,
        "fromAvatar": fromAvatar,
        "toToken": toToken,
        "msgid": msgid,
        "content": content,
        "type": type,
        "status": status,
        "createdAt": createdAt,
      };
}

class SyncMessageResponseEntity {
  int? code;
  String? msg;
  List<MsgListcontent>? data;

  SyncMessageResponseEntity({
    this.code,
    this.msg,
    this.data,
  });

  factory SyncMessageResponseEntity.fromJson(Map<String, dynamic> json) =>
      SyncMessageResponseEntity(
        code: json["code"],
        msg: json["msg"],
        data: json["data"] == null
            ? []
            : List<MsgListcontent>.from(
                json["data"].map((x) => MsgListcontent.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "counts": code,
        "msg": msg,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}
