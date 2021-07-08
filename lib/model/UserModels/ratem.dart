// To parse this JSON data, do
//
//     final rateM = rateMFromMap(jsonString);

import 'dart:convert';

class RateM {
  RateM({
    this.message,
  });

  String message;

  factory RateM.fromJson(String str) => RateM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RateM.fromMap(Map<String, dynamic> json) => RateM(
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
  };
}
