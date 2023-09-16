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
      };
}

class GarageSocialLink {
  final int? id;
  final int? garageId;
  final String? socialLink;
  final int? socialLinkType;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  GarageSocialLink({
    this.id,
    this.garageId,
    this.socialLink,
    this.socialLinkType,
    this.createdAt,
    this.updatedAt,
  });

  factory GarageSocialLink.fromJson(Map<String, dynamic> json) =>
      GarageSocialLink(
        id: json["id"],
        garageId: json["garageId"],
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
        "garageId": garageId,
        "socialLink": socialLink,
        "socialLinkType": socialLinkType,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class GarageSocialLinkCreate {
  final String? socialLink;
  final int? socialLinkType;

  GarageSocialLinkCreate({
    this.socialLink,
    this.socialLinkType,
  });

  factory GarageSocialLinkCreate.fromJson(Map<String, dynamic> json) =>
      GarageSocialLinkCreate(
        socialLink: json["socialLink"],
        socialLinkType: json["socialLinkType"],
      );

  Map<String, dynamic> toJson() => {
        "socialLink": socialLink,
        "socialLinkType": socialLinkType,
      };
}

class CreateGarage {
  final String? name;
  final String? address;
  final double? lat;
  final double? long;
  final String? description;
  final List<String>? phoneNumber;
  final List<String>? telegram;
  final List<String>? whatsApp;
  final List<String>? weChat;
  final List<GarageSocialLinkCreate>? garageSocialLinks;

  CreateGarage({
    this.name,
    this.address,
    this.lat,
    this.long,
    this.description,
    this.phoneNumber,
    this.telegram,
    this.whatsApp,
    this.weChat,
    this.garageSocialLinks,
  });

  factory CreateGarage.fromJson(Map<String, dynamic> json) => CreateGarage(
        name: json["name"],
        address: json["address"],
        lat: json["lat"],
        long: json["long"],
        description: json["description"],
        phoneNumber: json["phoneNumber"] == null
            ? []
            : List<String>.from(json["phoneNumber"]!.map((x) => x)),
        telegram: json["telegram"] == null
            ? []
            : List<String>.from(json["telegram"]!.map((x) => x)),
        whatsApp: json["whatsApp"] == null
            ? []
            : List<String>.from(json["whatsApp"]!.map((x) => x)),
        weChat: json["weChat"] == null
            ? []
            : List<String>.from(json["weChat"]!.map((x) => x)),
        garageSocialLinks: json["garageSocialLinks"] == null
            ? []
            : List<GarageSocialLinkCreate>.from(json["garageSocialLinks"]!
                .map((x) => GarageSocialLinkCreate.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "lat": lat,
        "long": long,
        "description": description,
        "phoneNumber": phoneNumber == null
            ? []
            : List<String>.from(phoneNumber!.map((x) => x)),
        "telegram":
            telegram == null ? [] : List<String>.from(telegram!.map((x) => x)),
        "whatsApp":
            whatsApp == null ? [] : List<String>.from(whatsApp!.map((x) => x)),
        "weChat":
            weChat == null ? [] : List<String>.from(weChat!.map((x) => x)),
        "garageSocialLinks": garageSocialLinks == null
            ? []
            : List<dynamic>.from(garageSocialLinks!.map((x) => x.toJson())),
      };
}

enum GarageSocialLinkType {
  none,
  youTube,
  facebook,
  instagram,
  twitter,
  tamneak,
  threads,
  tikTok,
}

class GarageSocialLinkView {
  final String socialLink;
  final String baseUrl;
  final String username;
  final int socialLinkType;
  final String socialName;

  GarageSocialLinkView({
    required this.socialLink,
    required this.baseUrl,
    required this.username,
    required this.socialLinkType,
    required this.socialName,
  });

  factory GarageSocialLinkView.fromJson(Map<String, dynamic> json) =>
      GarageSocialLinkView(
        socialLink: json["socialLink"],
        baseUrl: json["baseUrl"],
        username: json["username"],
        socialLinkType: json["socialLinkType"],
        socialName: json["socialName"],
      );

  Map<String, dynamic> toJson() => {
        "socialLink": socialLink,
        "baseUrl": baseUrl,
        "username": username,
        "socialLinkType": socialLinkType,
        "socialName": socialName,
      };
}

class GarageSocialLinks {
  static List<GarageSocialLinkView> get list => _list;

  static GarageSocialLinkView? findByType(int type) {
    return _list.firstWhere(
      (country) => country.socialLinkType == type,
      orElse: () {
        throw Exception('Invalid dial code: $type');
      },
    );
  }

  static String userNameFormat({
    required String baseUrl,
    required int type,
    required String username,
  }) {
    switch (type) {
      case 1:
      case 7:
        return "$baseUrl/@$username";
      default:
        return "$baseUrl/$username";
    }
  }

  static final List<GarageSocialLinkView> _list = [
    GarageSocialLinkView(
      baseUrl: "https://www.youtube.com",
      socialLink: "https://www.youtube.com/@codingtraining0102",
      socialLinkType: 1,
      username: "@codingtraining0102",
      socialName: "YouTube",
    ),
    GarageSocialLinkView(
      baseUrl: "https://www.facebook.com",
      socialLink: "https://www.facebook.com/nith.nos.7",
      socialLinkType: 2,
      username: "nith.nos.7",
      socialName: "Facebook",
    ),
    GarageSocialLinkView(
      baseUrl: "https://www.instagram.com",
      socialLink: "https://www.instagram.com/nith_z_290291",
      socialLinkType: 3,
      username: "nith_z_290291",
      socialName: "Instagram",
    ),
    GarageSocialLinkView(
      baseUrl: "https://twitter.com/CodingTrai36213",
      socialLink: "https://twitter.com/CodingTrai36213",
      socialLinkType: 4,
      username: "CodingTrai36213",
      socialName: "Twitter",
    ),
    GarageSocialLinkView(
      baseUrl: "https://www.tiktok.com",
      socialLink: "https://www.tiktok.com/@unknown_facts_29",
      socialLinkType: 7,
      username: "@unknown_facts_29",
      socialName: "TikTok",
    ),
  ];
}
