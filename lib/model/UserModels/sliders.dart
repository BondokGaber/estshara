// To parse this JSON data, do
//
//     final sliders = slidersFromMap(jsonString);

import 'dart:convert';

Sliders slidersFromMap(String str) => Sliders.fromMap(json.decode(str));

String slidersToMap(Sliders data) => json.encode(data.toMap());

class Sliders {
  Sliders({
    this.sliders,
  });

  List<Slider> sliders;

  factory Sliders.fromMap(Map<String, dynamic> json) => Sliders(
    sliders: List<Slider>.from(json["sliders"].map((x) => Slider.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "sliders": List<dynamic>.from(sliders.map((x) => x.toMap())),
  };
}

class Slider {
  Slider({
    this.id,
    this.title,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String title;
  String image;
  DateTime createdAt;
  DateTime updatedAt;

  factory Slider.fromMap(Map<String, dynamic> json) => Slider(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "image": image,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
