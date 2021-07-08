// To parse this JSON data, do
//
//     final profile = profileFromMap(jsonString);

import 'dart:convert';

Profile profileFromMap(String str) => Profile.fromMap(json.decode(str));

String profileToMap(Profile data) => json.encode(data.toMap());

class Profile {
  Profile({
    this.clienttData,
  });

  ClienttData clienttData;

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
    clienttData: ClienttData.fromMap(json["clienttData"]),
  );

  Map<String, dynamic> toMap() => {
    "clienttData": clienttData.toMap(),
  };
}

class ClienttData {
  ClienttData({
    this.id,
    this.image,
    this.name,
    this.phone,
    this.email,
    this.password,
    this.birthdate,
    this.gender,
    this.type,
    this.totalRate,
    this.totalSessions,
    this.token,
    this.costPermission,
    this.createdAt,
    this.updatedAt,
    this.reservations,
  });

  int id;
  dynamic image;
  String name;
  String phone;
  String email;
  String password;
  DateTime birthdate;
  String gender;
  String type;
  int totalRate;
  dynamic totalSessions;
  String token;
  String costPermission;
  DateTime createdAt;
  DateTime updatedAt;
  List<dynamic> reservations;

  factory ClienttData.fromMap(Map<String, dynamic> json) => ClienttData(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
    birthdate: DateTime.parse(json["birthdate"]),
    gender: json["gender"],
    type: json["type"],
    totalRate: json["total_rate"],
    totalSessions: json["total_sessions"],
    token: json["token"],
    costPermission: json["cost_permission"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    reservations: List<dynamic>.from(json["reservations"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "image": image,
    "name": name,
    "phone": phone,
    "email": email,
    "password": password,
    "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "type": type,
    "total_rate": totalRate,
    "total_sessions": totalSessions,
    "token": token,
    "cost_permission": costPermission,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "reservations": List<dynamic>.from(reservations.map((x) => x)),
  };
}
