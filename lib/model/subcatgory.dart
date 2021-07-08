// To parse this JSON data, do
//
//     final subCatgory = subCatgoryFromMap(jsonString);

import 'dart:convert';

class SubCatgory {
  SubCatgory({
    this.subCatgories,
  });

  List<SubCatgoryElement> subCatgories;

  factory SubCatgory.fromJson(String str) => SubCatgory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubCatgory.fromMap(Map<String, dynamic> json) => SubCatgory(
    subCatgories: List<SubCatgoryElement>.from(json["subCatgories"].map((x) => SubCatgoryElement.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "subCatgories": List<dynamic>.from(subCatgories.map((x) => x.toMap())),
  };
}

class SubCatgoryElement {
  SubCatgoryElement({
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

  factory SubCatgoryElement.fromJson(String str) => SubCatgoryElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubCatgoryElement.fromMap(Map<String, dynamic> json) => SubCatgoryElement(
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
