// To parse this JSON data, do
//
//     final userMl = userMlFromMap(jsonString);

import 'dart:convert';

class UserMl {
  UserMl({
    this.status,
    this.message,
    this.userl,
    this.token,
  });

  bool status;
  String message;
  Userl userl;
  String token;

  factory UserMl.fromJson(String str) => UserMl.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserMl.fromMap(Map<String, dynamic> json) => UserMl(
    status: json["status"],
    message: json["message"],
    userl: Userl.fromMap(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "message": message,
    "user": userl.toMap(),
    "token": token,
  };
}

class Userl {
  Userl({
    this.id,
    this.image,
    this.name,
    this.phone,
    this.phoneTwo,
    this.email,
    this.password,
    this.birthdate,
    this.gender,
    this.type,
    this.yearsOfExperience,
    this.education,
    this.educationCerteficateImage,
    this.experiences,
    this.experienceCerteficateImage,
    this.totalRate,
    this.totalSessions,
    this.token,
    this.costPermission,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String image;
  String name;
  String phone;
  String phoneTwo;
  String email;
  String password;
  DateTime birthdate;
  String gender;
  String type;
  int yearsOfExperience;
  String education;
  String educationCerteficateImage;
  String experiences;
  String experienceCerteficateImage;
  int totalRate;
  int totalSessions;
  String token;
  String costPermission;
  DateTime createdAt;
  DateTime updatedAt;

  factory Userl.fromJson(String str) => Userl.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Userl.fromMap(Map<String, dynamic> json) => Userl(
    id: json["id"],
    image: json["image"],
    name: json["name"],
    phone: json["phone"],
    phoneTwo: json["phone_two"],
    email: json["email"],
    password: json["password"],
    birthdate: DateTime.parse(json["birthdate"]),
    gender: json["gender"],
    type: json["type"],
    yearsOfExperience: json["years_of_experience"],
    education: json["education"],
    educationCerteficateImage: json["education_certeficate_image"],
    experiences: json["experiences"],
    experienceCerteficateImage: json["experience_certeficate_image"],
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
    "phone_two": phoneTwo,
    "email": email,
    "password": password,
    "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "type": type,
    "years_of_experience": yearsOfExperience,
    "education": education,
    "education_certeficate_image": educationCerteficateImage,
    "experiences": experiences,
    "experience_certeficate_image": experienceCerteficateImage,
    "total_rate": totalRate,
    "total_sessions": totalSessions,
    "token": token,
    "cost_permission": costPermission,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
