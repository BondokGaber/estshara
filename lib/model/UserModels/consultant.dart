// To parse this JSON data, do
//
//     final consultant = consultantFromMap(jsonString);

import 'dart:convert';

Consultant consultantFromMap(String str) => Consultant.fromMap(json.decode(str));

String consultantToMap(Consultant data) => json.encode(data.toMap());

class Consultant {
  Consultant({
    this.consultants,
  });

  List<ConsultantElement> consultants;

  factory Consultant.fromMap(Map<String, dynamic> json) => Consultant(
    consultants: List<ConsultantElement>.from(json["consultants"].map((x) => ConsultantElement.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "consultants": List<dynamic>.from(consultants.map((x) => x.toMap())),
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
  int subcategoryId;
  DateTime createdAt;
  DateTime updatedAt;
  ConsultantConsultant consultant;

  factory ConsultantElement.fromMap(Map<String, dynamic> json) => ConsultantElement(
    id: json["id"],
    consultantId: json["consultant_id"],
    categoryId: json["category_id"],
    subcategoryId: json["subcategory_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    consultant: ConsultantConsultant.fromMap(json["consultant"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "consultant_id": consultantId,
    "category_id": categoryId,
    "subcategory_id": subcategoryId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "consultant": consultant.toMap(),
  };
}

class ConsultantConsultant {
  ConsultantConsultant({
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

  factory ConsultantConsultant.fromMap(Map<String, dynamic> json) => ConsultantConsultant(
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
