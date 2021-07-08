// To parse this JSON data, do
//
//     final blog = blogFromMap(jsonString);


import 'dart:convert';

Blog blogFromMap(String str) => Blog.fromMap(json.decode(str));

String blogToMap(Blog data) => json.encode(data.toMap());

class Blog {
  Blog({
    this.blogs,
  });

  List<BlogElement> blogs;

  factory Blog.fromMap(Map<String, dynamic> json) => Blog(
    blogs: List<BlogElement>.from(json["blogs"].map((x) => BlogElement.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "blogs": List<dynamic>.from(blogs.map((x) => x.toMap())),
  };
}

class BlogElement {
  BlogElement({
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

  factory BlogElement.fromMap(Map<String, dynamic> json) => BlogElement(
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
