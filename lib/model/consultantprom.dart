// To parse this JSON data, do
//
//     final consultantProM = consultantProMFromMap(jsonString);

import 'dart:convert';

class ConsultantProM {
  ConsultantProM({
    this.consultantData,
    this.appointments,
  });

  ConsultantData consultantData;
  Appointments appointments;

  factory ConsultantProM.fromJson(String str) => ConsultantProM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConsultantProM.fromMap(Map<String, dynamic> json) => ConsultantProM(
    consultantData: ConsultantData.fromMap(json["consultantData"]),
    appointments: Appointments.fromMap(json["appointments"]),
  );

  Map<String, dynamic> toMap() => {
    "consultantData": consultantData.toMap(),
    "appointments": appointments.toMap(),
  };
}

class Appointments {
  Appointments({
    this.thu,
    this.mon,
    this.tue,
  });

  List<Mon> thu;
  List<Mon> mon;
  List<Mon> tue;

  factory Appointments.fromJson(String str) => Appointments.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Appointments.fromMap(Map<String, dynamic> json) => Appointments(
    thu: List<Mon>.from(json["Thu"].map((x) => Mon.fromMap(x))),
    mon: List<Mon>.from(json["Mon"].map((x) => Mon.fromMap(x))),
    tue: List<Mon>.from(json["Tue"].map((x) => Mon.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "Thu": List<dynamic>.from(thu.map((x) => x.toMap())),
    "Mon": List<dynamic>.from(mon.map((x) => x.toMap())),
    "Tue": List<dynamic>.from(tue.map((x) => x.toMap())),
  };
}

class Mon {
  Mon({
    this.id,
    this.customerId,
    this.date,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int customerId;
  DateTime date;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Mon.fromJson(String str) => Mon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Mon.fromMap(Map<String, dynamic> json) => Mon(
    id: json["id"],
    customerId: json["customer_id"],
    date: DateTime.parse(json["date"]),
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "customer_id": customerId,
    "date": date.toIso8601String(),
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class ConsultantData {
  ConsultantData({
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
    this.reviews,
    this.sections,
    this.wallet,
    this.categories,
  });

  int id;
  dynamic image;
  String name;
  String phone;
  dynamic phoneTwo;
  String email;
  String password;
  DateTime birthdate;
  String gender;
  String type;
  int yearsOfExperience;
  String education;
  dynamic educationCerteficateImage;
  String experiences;
  dynamic experienceCerteficateImage;
  int totalRate;
  int totalSessions;
  dynamic token;
  String costPermission;
  DateTime createdAt;
  DateTime updatedAt;
  List<Review> reviews;
  List<Section> sections;
  Wallet wallet;
  List<Category> categories;

  factory ConsultantData.fromJson(String str) => ConsultantData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ConsultantData.fromMap(Map<String, dynamic> json) => ConsultantData(
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
    reviews: List<Review>.from(json["reviews"].map((x) => Review.fromMap(x))),
    sections: List<Section>.from(json["sections"].map((x) => Section.fromMap(x))),
    wallet: Wallet.fromMap(json["wallet"]),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromMap(x))),
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
    "reviews": List<dynamic>.from(reviews.map((x) => x.toMap())),
    "sections": List<dynamic>.from(sections.map((x) => x.toMap())),
    "wallet": wallet.toMap(),
    "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
  };
}

class Category {
  Category({
    this.id,
    this.consultantId,
    this.categoryId,
    this.subcategoryId,
    this.createdAt,
    this.updatedAt,
    this.categories,
  });

  int id;
  int consultantId;
  int categoryId;
  dynamic subcategoryId;
  DateTime createdAt;
  DateTime updatedAt;
  Categories categories;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
    id: json["id"],
    consultantId: json["consultant_id"],
    categoryId: json["category_id"],
    subcategoryId: json["subcategory_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    categories: Categories.fromMap(json["categories"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "consultant_id": consultantId,
    "category_id": categoryId,
    "subcategory_id": subcategoryId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "categories": categories.toMap(),
  };
}

class Categories {
  Categories({
    this.id,
    this.name,
    this.type,
    this.duration,
    this.cost,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String type;
  String duration;
  int cost;
  DateTime createdAt;
  DateTime updatedAt;

  factory Categories.fromJson(String str) => Categories.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categories.fromMap(Map<String, dynamic> json) => Categories(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    duration: json["duration"],
    cost: json["cost"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "type": type,
    "duration": duration,
    "cost": cost,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Review {
  Review({
    this.id,
    this.consultantId,
    this.clientId,
    this.comment,
    this.rate,
    this.createdAt,
    this.updatedAt,
    this.client,
  });

  int id;
  int consultantId;
  int clientId;
  dynamic comment;
  int rate;
  DateTime createdAt;
  DateTime updatedAt;
  Client client;

  factory Review.fromJson(String str) => Review.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Review.fromMap(Map<String, dynamic> json) => Review(
    id: json["id"],
    consultantId: json["consultant_id"],
    clientId: json["client_id"],
    comment: json["comment"],
    rate: json["rate"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    client: Client.fromMap(json["client"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "consultant_id": consultantId,
    "client_id": clientId,
    "comment": comment,
    "rate": rate,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "client": client.toMap(),
  };
}

class Client {
  Client({
    this.id,
    this.image,
    this.name,
  });

  int id;
  dynamic image;
  String name;

  factory Client.fromJson(String str) => Client.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Client.fromMap(Map<String, dynamic> json) => Client(
    id: json["id"],
    image: json["image"],
    name: json["name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "image": image,
    "name": name,
  };
}

class Section {
  Section({
    this.id,
    this.customerId,
    this.header,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int customerId;
  String header;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory Section.fromJson(String str) => Section.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Section.fromMap(Map<String, dynamic> json) => Section(
    id: json["id"],
    customerId: json["customer_id"],
    header: json["header"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "customer_id": customerId,
    "header": header,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

class Wallet {
  Wallet({
    this.id,
    this.consultantId,
    this.availableBalance,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int consultantId;
  int availableBalance;
  DateTime createdAt;
  DateTime updatedAt;

  factory Wallet.fromJson(String str) => Wallet.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Wallet.fromMap(Map<String, dynamic> json) => Wallet(
    id: json["id"],
    consultantId: json["consultant_id"],
    availableBalance: json["available_balance"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "consultant_id": consultantId,
    "available_balance": availableBalance,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
