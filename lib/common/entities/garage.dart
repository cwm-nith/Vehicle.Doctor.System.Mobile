import 'package:vehicle_doctor_mobile/common/entities/entities.dart';

class GaragePageResponse extends Pagination {
  List<Garage>? items = List<Garage>.empty();
  GaragePageResponse({
    super.isEmpty,
    super.isNotEmpty,
    super.currentPage,
    super.resultsPerPage,
    super.totalPages,
    super.totalResults,
    this.items,
  });
  factory GaragePageResponse.fromJson(Map<String, dynamic> json) =>
      GaragePageResponse(
        items: json["items"] == null
            ? []
            : List<Garage>.from(
                json["items"]!.map(
                  (x) => Garage.fromJson(x),
                ),
              ),
        isEmpty: json["isEmpty"],
        isNotEmpty: json["isNotEmpty"],
        currentPage: json["currentPage"],
        resultsPerPage: json["resultsPerPage"],
        totalPages: json["totalPages"],
        totalResults: json["totalResults"],
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(
                items!.map(
                  (x) => x.toJson(),
                ),
              ),
        "isEmpty": isEmpty,
        "isNotEmpty": isNotEmpty,
        "currentPage": currentPage,
        "resultsPerPage": resultsPerPage,
        "totalPages": totalPages,
        "totalResults": totalResults,
      };
}

class Garage {
  final int? id;
  final String? name;
  final String? address;
  final double? lat;
  final double? long;
  final String? description;
  final int? userId;
  final DateTime? deletedAt;
  final int? deletedBy;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? updatedBy;
  final List<GarageContact>? garageContacts;

  Garage({
    this.id,
    this.name,
    this.address,
    this.lat,
    this.long,
    this.description,
    this.userId,
    this.deletedAt,
    this.deletedBy,
    this.createdAt,
    this.updatedAt,
    this.updatedBy,
    this.garageContacts,
  });

  factory Garage.fromJson(Map<String, dynamic> json) => Garage(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        lat: json["lat"]?.toDouble(),
        long: json["long"]?.toDouble(),
        description: json["description"],
        userId: json["userId"],
        deletedAt: json["deletedAt"] == null
            ? null
            : DateTime.parse(json["deletedAt"]),
        deletedBy: json["deletedBy"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        updatedBy: json["updatedBy"],
        garageContacts: json["garageContacts"] == null
            ? []
            : List<GarageContact>.from(
                json["garageContacts"]!.map((x) => GarageContact.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "lat": lat,
        "long": long,
        "description": description,
        "userId": userId,
        "deletedAt": deletedAt?.toIso8601String(),
        "deletedBy": deletedBy,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "updatedBy": updatedBy,
        "garageContacts": garageContacts == null
            ? []
            : List<dynamic>.from(garageContacts!.map((x) => x.toJson())),
      };
}

class GarageContact {
  final int? id;
  final int? garageId;
  final String? phoneNumber;
  final String? telegram;
  final String? whatsApp;
  final String? weChat;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<GarageSocialLink>? garageSocialLinks;

  GarageContact({
    this.id,
    this.garageId,
    this.phoneNumber,
    this.telegram,
    this.whatsApp,
    this.weChat,
    this.createdAt,
    this.updatedAt,
    this.garageSocialLinks,
  });

  factory GarageContact.fromJson(Map<String, dynamic> json) => GarageContact(
        id: json["id"],
        garageId: json["garageId"],
        phoneNumber: json["phoneNumber"],
        telegram: json["telegram"],
        whatsApp: json["whatsApp"],
        weChat: json["weChat"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        garageSocialLinks: json["garageSocialLinks"] == null
            ? []
            : List<GarageSocialLink>.from(json["garageSocialLinks"]!
                .map((x) => GarageSocialLink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "garageId": garageId,
        "phoneNumber": phoneNumber,
        "telegram": telegram,
        "whatsApp": whatsApp,
        "weChat": weChat,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "garageSocialLinks": garageSocialLinks == null
            ? []
            : List<dynamic>.from(garageSocialLinks!.map((x) => x.toJson())),
      };
}

class GarageSocialLink {
  final int? id;
  final int? garageContactId;
  final String? socialLink;
  final int? socialLinkType;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GarageSocialLink({
    this.id,
    this.garageContactId,
    this.socialLink,
    this.socialLinkType,
    this.createdAt,
    this.updatedAt,
  });

  factory GarageSocialLink.fromJson(Map<String, dynamic> json) =>
      GarageSocialLink(
        id: json["id"],
        garageContactId: json["garageContactId"],
        socialLink: json["socialLink"],
        socialLinkType: json["socialLinkType"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "garageContactId": garageContactId,
        "socialLink": socialLink,
        "socialLinkType": socialLinkType,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
