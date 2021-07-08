// To parse this JSON data, do
//
//     final blogDetailsM = blogDetailsMFromMap(jsonString);

import 'dart:convert';

BlogDetailsM blogDetailsMFromMap(String str) => BlogDetailsM.fromMap(json.decode(str));

String blogDetailsMToMap(BlogDetailsM data) => json.encode(data.toMap());

class BlogDetailsM {
  BlogDetailsM({
    this.blogs,
  });

  Blogs blogs;

  factory BlogDetailsM.fromMap(Map<String, dynamic> json) => BlogDetailsM(
    blogs: Blogs.fromMap(json["blogs"]),
  );

  Map<String, dynamic> toMap() => {
    "blogs": blogs.toMap(),
  };
}

class Blogs {
  Blogs({
    this.id,
    this.image,
    this.title,
    this.details,
    this.userId,
    this.likes,
    this.shares,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  int id;
  dynamic image;
  String title;
  String details;
  int userId;
  dynamic likes;
  dynamic shares;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic user;

  factory Blogs.fromMap(Map<String, dynamic> json) => Blogs(
    id: json["id"],
    image: json["image"],
    title: json["title"],
    details: json["details"],
    userId: json["user_id"],
    likes: json["likes"],
    shares: json["shares"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    user: json["user"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "image": image,
    "title": title,
    "details": details,
    "user_id": userId,
    "likes": likes,
    "shares": shares,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "user": user,
  };
}
