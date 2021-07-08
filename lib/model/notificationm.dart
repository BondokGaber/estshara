// To parse this JSON data, do
//
//     final notificationM = notificationMFromMap(jsonString);

import 'dart:convert';

class NotificationM {
  NotificationM({
    this.notifications,
  });

  List<Notification> notifications;

  factory NotificationM.fromJson(String str) => NotificationM.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory NotificationM.fromMap(Map<String, dynamic> json) => NotificationM(
    notifications: List<Notification>.from(json["notifications"].map((x) => Notification.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "notifications": List<dynamic>.from(notifications.map((x) => x.toMap())),
  };
}

class Notification {
  Notification({
    this.type,
    this.message,
    this.data,
    this.clientId,
    this.cost,
    this.date,
  });

  String type;
  String message;
  Data data;
  String clientId;
  int cost;
  DateTime date;

  factory Notification.fromJson(String str) => Notification.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Notification.fromMap(Map<String, dynamic> json) => Notification(
    type: json["type"] == null ? null : json["type"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromMap(json["data"]),
    clientId: json["Client_id"] == null ? null : json["Client_id"],
    cost: json["cost"] == null ? null : json["cost"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toMap() => {
    "type": type == null ? null : type,
    "message": message,
    "data": data == null ? null : data.toMap(),
    "Client_id": clientId == null ? null : clientId,
    "cost": cost == null ? null : cost,
    "date": date == null ? null : date.toIso8601String(),
  };
}

class Data {
  Data({
    this.id,
    this.image,
    this.title,
    this.details,
    this.type,
    this.userId,
    this.likes,
    this.shares,
    this.createdAt,
    this.updatedAt,
    this.clientId,
    this.cost,
    this.date,
  });

  int id;
  dynamic image;
  String title;
  String details;
  String type;
  int userId;
  int likes;
  int shares;
  DateTime createdAt;
  DateTime updatedAt;
  String clientId;
  int cost;
  DateTime date;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    id: json["id"] == null ? null : json["id"],
    image: json["image"],
    title: json["title"] == null ? null : json["title"],
    details: json["details"] == null ? null : json["details"],
    type: json["type"],
    userId: json["user_id"] == null ? null : json["user_id"],
    likes: json["likes"] == null ? null : json["likes"],
    shares: json["shares"] == null ? null : json["shares"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    clientId: json["Client_id"] == null ? null : json["Client_id"],
    cost: json["cost"] == null ? null : json["cost"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "image": image,
    "title": title == null ? null : title,
    "details": details == null ? null : details,
    "type": type,
    "user_id": userId == null ? null : userId,
    "likes": likes == null ? null : likes,
    "shares": shares == null ? null : shares,
    "created_at": createdAt == null ? null : createdAt.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
    "Client_id": clientId == null ? null : clientId,
    "cost": cost == null ? null : cost,
    "date": date == null ? null : date.toIso8601String(),
  };
}
