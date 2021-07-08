import 'dart:convert';

class DeleteM {
  DeleteM({
    this.message,
  });

  String message;

  factory DeleteM.fromJson(String str) => DeleteM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteM.fromMap(Map<String, dynamic> json) => DeleteM(
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
  };
}
