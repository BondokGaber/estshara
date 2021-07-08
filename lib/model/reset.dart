

import 'dart:convert';

class ResetM {
  ResetM({
    this.message,
    this.data,
  });

  String message;
  Data data;

  factory ResetM.fromJson(String str) => ResetM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResetM.fromMap(Map<String, dynamic> json) => ResetM(
    message: json["message"],
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "message": message,
    "data": data.toMap(),
  };
}

class Data {
  Data({
    this.code,
    this.expDate,
  });

  int code;
  DateTime expDate;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    code: json["code"],
    expDate: DateTime.parse(json["exp_date"]),
  );

  Map<String, dynamic> toMap() => {
    "code": code,
    "exp_date": expDate.toIso8601String(),
  };
}
