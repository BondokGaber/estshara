// To parse this JSON data, do
//
//     final consultant = consultantFromMap(jsonString);

import 'dart:convert';

class Consultant {
  Consultant({
    this.consultants,
    this.cost,
  });

  List<ConsultantElement> consultants;
  int cost;

  factory Consultant.fromJson(String str) => Consultant.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Consultant.fromMap(Map<String, dynamic> json) => Consultant(
    consultants: List<ConsultantElement>.from(json["consultants"].map((x) => ConsultantElement.fromMap(x))),
    cost: json["cost"],
  );

  Map<String, dynamic> toMap() => {
    "consultants": List<dynamic>.from(consultants.map((x) => x.toMap())),
    "cost": cost,
  };
}

class ConsultantElement {
  ConsultantElement({
    this.id,
    this.consultantId,
    this.categoryId,
    this.subcategoryId,
    this.createdAt,
    this.updatedAt,
    this.consultant,
  });

  int id;
  int consultantId;
  int categoryId;
  dynamic subcategoryId;
  DateTime createdAt;
  DateTime updatedAt;
  ConsultantConsultant consultant;

  factory ConsultantElement.fromJson(String str) => ConsultantElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConsultantElement.fromMap(Map<String, dynamic> json) => ConsultantElement(
    id: json["id"],
    consultantId: json["consultant_id"],
    categoryId: json["category_id"],
    subcategoryId: json["subcategory_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    consultant: json["consultant"] == null ? null : ConsultantConsultant.fromMap(json["consultant"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "consultant_id": consultantId,
    "category_id": categoryId,
    "subcategory_id": subcategoryId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "consultant": consultant == null ? null : consultant.toMap(),
  };
}

class ConsultantConsultant {
  ConsultantConsultant({
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

  factory ConsultantConsultant.fromJson(String str) => ConsultantConsultant.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConsultantConsultant.fromMap(Map<String, dynamic> json) => ConsultantConsultant(
    id: json["id"],
    image: json["image"] == null ? null : json["image"],
    name: json["name"],
    phone: json["phone"],
    phoneTwo: json["phone_two"] == null ? null : json["phone_two"],
    email: json["email"],
    password: json["password"],
    birthdate: DateTime.parse(json["birthdate"]),
    gender: json["gender"],
    type: json["type"],
    yearsOfExperience: json["years_of_experience"] == null ? null : json["years_of_experience"],
    education: json["education"] == null ? null : json["education"],
    educationCerteficateImage: json["education_certeficate_image"] == null ? null : json["education_certeficate_image"],
    experiences: json["experiences"] == null ? null : json["experiences"],
    experienceCerteficateImage: json["experience_certeficate_image"] == null ? null : json["experience_certeficate_image"],
    totalRate: json["total_rate"],
    totalSessions: json["total_sessions"],
    token: json["token"] == null ? null : json["token"],
    costPermission: json["cost_permission"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "image": image == null ? null : image,
    "name": name,
    "phone": phone,
    "phone_two": phoneTwo == null ? null : phoneTwo,
    "email": email,
    "password": password,
    "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
    "gender": gender,
    "type": type,
    "years_of_experience": yearsOfExperience == null ? null : yearsOfExperience,
    "education": education == null ? null : education,
    "education_certeficate_image": educationCerteficateImage == null ? null : educationCerteficateImage,
    "experiences": experiences == null ? null : experiences,
    "experience_certeficate_image": experienceCerteficateImage == null ? null : experienceCerteficateImage,
    "total_rate": totalRate,
    "total_sessions": totalSessions,
    "token": token == null ? null : token,
    "cost_permission": costPermission,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
