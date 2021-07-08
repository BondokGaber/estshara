// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

class User {
  User({
    this.user,
    this.token,
  });

  UserClass user;
  String token;

  factory User.fromMap(Map<String, dynamic> json) => User(
    user: UserClass.fromMap(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
    "user": user.toMap(),
    "token": token,
  };
}

class UserClass {
  UserClass({
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
  dynamic token;
  String costPermission;
  DateTime createdAt;
  DateTime updatedAt;

  factory UserClass.fromMap(Map<String, dynamic> json) => UserClass(
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
  };
}
