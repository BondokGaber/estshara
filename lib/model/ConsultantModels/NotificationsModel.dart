class NotificationsModel {
  String type;
  String message;
  Data data;

  NotificationsModel({this.type, this.message, this.data});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  String image;
  String title;
  String details;
  String type;
  int userId;
  int likes;
  int shares;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
        this.image,
        this.title,
        this.details,
        this.type,
        this.userId,
        this.likes,
        this.shares,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    details = json['details'];
    type = json['type'];
    userId = json['user_id'];
    likes = json['likes'];
    shares = json['shares'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['title'] = this.title;
    data['details'] = this.details;
    data['type'] = this.type;
    data['user_id'] = this.userId;
    data['likes'] = this.likes;
    data['shares'] = this.shares;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}