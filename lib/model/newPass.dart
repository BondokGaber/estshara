
// To parse this JSON data, do
//
//     final newPassM = newPassMFromMap(jsonString);

import 'dart:convert';

class NewPassM {
  NewPassM({
    this.message,
  });

  String message;

  factory NewPassM.fromJson(String str) => NewPassM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NewPassM.fromMap(Map<String, dynamic> json) => NewPassM(
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
  };
}
