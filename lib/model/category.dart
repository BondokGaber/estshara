// To parse this JSON data, do
//
//     final catgoryM = catgoryMFromMap(jsonString);

import 'dart:convert';

class CatgoryM {
  CatgoryM({
    this.catgories,
  });

  List<Catgory> catgories;

  factory CatgoryM.fromJson(String str) => CatgoryM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CatgoryM.fromMap(Map<String, dynamic> json) => CatgoryM(
    catgories: List<Catgory>.from(json["Catgories"].map((x) => Catgory.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "Catgories": List<dynamic>.from(catgories.map((x) => x.toMap())),
  };
}

class Catgory {
  Catgory({
    this.id,
    this.name,
    this.type,
    this.image,
    this.duration,
    this.cost,
    this.createdAt,
    this.updatedAt,
    this.subcategories,
  });

  int id;
  String name;
  String type;
  String image;
  String duration;
  int cost;
  DateTime createdAt;
  DateTime updatedAt;
  List<Subcategory> subcategories;

  factory Catgory.fromJson(String str) => Catgory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Catgory.fromMap(Map<String, dynamic> json) => Catgory(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    image: json["image"],
    duration: json["duration"],
    cost: json["cost"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    subcategories: List<Subcategory>.from(json["subcategories"].map((x) => Subcategory.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "type": type,
    "image": image,
    "duration": duration,
    "cost": cost,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "subcategories": List<dynamic>.from(subcategories.map((x) => x.toMap())),
  };
}

class Subcategory {
  Subcategory({
    this.id,
    this.categoryId,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int categoryId;
  String name;
  DateTime createdAt;
  DateTime updatedAt;

  factory Subcategory.fromJson(String str) => Subcategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Subcategory.fromMap(Map<String, dynamic> json) => Subcategory(
    id: json["id"],
    categoryId: json["category_id"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "category_id": categoryId,
    "name": name,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
