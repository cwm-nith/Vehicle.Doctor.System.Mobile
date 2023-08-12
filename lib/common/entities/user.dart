class UserEntity {
  final int? id;
  final String? name;
  final String? username;
  final String? phoneNumber;
  final String? token;
  final DateTime? lastLogin;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? mobileToken;
  final int updatedBy;
  final DateTime? deletedAt;
  final DateTime? deletedBy;

  UserEntity({
    this.id,
    this.name,
    this.username,
    this.phoneNumber,
    this.token,
    this.lastLogin,
    this.createdAt,
    this.updatedAt,
    this.mobileToken,
    this.updatedBy = 0,
    this.deletedAt,
    this.deletedBy,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        phoneNumber: json["phoneNumber"],
        token: json["token"],
        lastLogin: DateTime.parse(json["lastLogin"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        mobileToken: json["mobileToken"],
        updatedBy: json["updatedBy"],
        deletedAt: json["deletedAt"] != null
            ? DateTime.parse(json["deletedAt"])
            : null,
        deletedBy: json["deletedBy"] != null
            ? DateTime.parse(json["deletedBy"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "phoneNumber": phoneNumber,
        "token": token,
        "lastLogin": lastLogin?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "mobileToken": mobileToken,
        "updatedBy": updatedBy,
        "deletedAt": deletedAt?.toIso8601String(),
        "deletedBy": deletedBy?.toIso8601String(),
      };
}

class UpdateUserRq {
  String phoneNumber;
  String name;

  UpdateUserRq({
    required this.phoneNumber,
    required this.name,
  });

  factory UpdateUserRq.fromJson(Map<String, dynamic> json) => UpdateUserRq(
        phoneNumber: json["phoneNumber"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "phoneNumber": phoneNumber,
        "name": name,
      };
}
