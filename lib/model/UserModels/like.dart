import 'dart:convert';

class LikeM {
  LikeM({
    this.message,
  });

  String message;

  factory LikeM.fromJson(String str) => LikeM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LikeM.fromMap(Map<String, dynamic> json) => LikeM(
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "message": message,
  };
}
