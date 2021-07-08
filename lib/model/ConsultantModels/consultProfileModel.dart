class consultProfileModel {
  ConsultantData consultantData;

  consultProfileModel({this.consultantData});

  consultProfileModel.fromJson(Map<String, dynamic> json) {
    consultantData = json['consultantData'] != null
        ? new ConsultantData.fromJson(json['consultantData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.consultantData != null) {
      data['consultantData'] = this.consultantData.toJson();
    }
    return data;
  }
}

class ConsultantData {
  int id;
  String image;
  String name;
  String phone;
  String phoneTwo;
  String email;
  String password;
  String birthdate;
  String gender;
  String type;
  int yearsOfExperience;
  String education;
  String educationCerteficateImage;
  String experiences;
  String experienceCerteficateImage;
  int totalRate;
  int totalSessions;
  String token;
  String costPermission;
  String createdAt;
  String updatedAt;
  List<Reviews> reviews;
  List<String> sections;
  Wallet wallet;
  List<Categories> categories;

  ConsultantData(
      {this.id,
        this.image,
        this.name,
        this.phone,
        this.phoneTwo,
        this.email,
        this.password,
        this.birthdate,
        this.gender,
        this.type,
        this.yearsOfExperience,
        this.education,
        this.educationCerteficateImage,
        this.experiences,
        this.experienceCerteficateImage,
        this.totalRate,
        this.totalSessions,
        this.token,
        this.costPermission,
        this.createdAt,
        this.updatedAt,
        this.reviews,
        this.sections,
        this.wallet,
        this.categories});

  ConsultantData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    phone = json['phone'];
    phoneTwo = json['phone_two'];
    email = json['email'];
    password = json['password'];
    birthdate = json['birthdate'];
    gender = json['gender'];
    type = json['type'];
    yearsOfExperience = json['years_of_experience'];
    education = json['education'];
    educationCerteficateImage = json['education_certeficate_image'];
    experiences = json['experiences'];
    experienceCerteficateImage = json['experience_certeficate_image'];
    totalRate = json['total_rate'];
    totalSessions = json['total_sessions'];
    token = json['token'];
    costPermission = json['cost_permission'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['reviews'] != null) {
      reviews = new List<Reviews>();
      json['reviews'].forEach((v) {
        reviews.add(new Reviews.fromJson(v));
      });
    }
    sections = json['sections'].cast<String>();
    wallet =
    json['wallet'] != null ? new Wallet.fromJson(json['wallet']) : null;
    if (json['categories'] != null) {
      categories = new List<Categories>();
      json['categories'].forEach((v) {
        categories.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['phone_two'] = this.phoneTwo;
    data['email'] = this.email;
    data['password'] = this.password;
    data['birthdate'] = this.birthdate;
    data['gender'] = this.gender;
    data['type'] = this.type;
    data['years_of_experience'] = this.yearsOfExperience;
    data['education'] = this.education;
    data['education_certeficate_image'] = this.educationCerteficateImage;
    data['experiences'] = this.experiences;
    data['experience_certeficate_image'] = this.experienceCerteficateImage;
    data['total_rate'] = this.totalRate;
    data['total_sessions'] = this.totalSessions;
    data['token'] = this.token;
    data['cost_permission'] = this.costPermission;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.reviews != null) {
      data['reviews'] = this.reviews.map((v) => v.toJson()).toList();
    }
    data['sections'] = this.sections;
    if (this.wallet != null) {
      data['wallet'] = this.wallet.toJson();
    }
    if (this.categories != null) {
      data['categories'] = this.categories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  int id;
  int consultantId;
  int clientId;
  Null comment;
  int rate;
  String createdAt;
  String updatedAt;
  Client client;

  Reviews(
      {this.id,
        this.consultantId,
        this.clientId,
        this.comment,
        this.rate,
        this.createdAt,
        this.updatedAt,
        this.client});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consultantId = json['consultant_id'];
    clientId = json['client_id'];
    comment = json['comment'];
    rate = json['rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    client =
    json['client'] != null ? new Client.fromJson(json['client']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['consultant_id'] = this.consultantId;
    data['client_id'] = this.clientId;
    data['comment'] = this.comment;
    data['rate'] = this.rate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.client != null) {
      data['client'] = this.client.toJson();
    }
    return data;
  }
}

class Client {
  int id;
  Null image;
  String name;

  Client({this.id, this.image, this.name});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}

class Wallet {
  int id;
  int consultantId;
  int availableBalance;
  String createdAt;
  String updatedAt;

  Wallet(
      {this.id,
        this.consultantId,
        this.availableBalance,
        this.createdAt,
        this.updatedAt});

  Wallet.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consultantId = json['consultant_id'];
    availableBalance = json['available_balance'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['consultant_id'] = this.consultantId;
    data['available_balance'] = this.availableBalance;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Categories {
  int id;
  int consultantId;
  int categoryId;
  int subcategoryId;
  String createdAt;
  String updatedAt;
  Categories categories;

  Categories(
      {this.id,
        this.consultantId,
        this.categoryId,
        this.subcategoryId,
        this.createdAt,
        this.updatedAt,
        this.categories});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consultantId = json['consultant_id'];
    categoryId = json['category_id'];
    subcategoryId = json['subcategory_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    categories = json['categories'] != null
        ? new Categories.fromJson(json['categories'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['consultant_id'] = this.consultantId;
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.categories != null) {
      data['categories'] = this.categories.toJson();
    }
    return data;
  }
}

class categories {
  int id;
  String name;
  String type;
  String duration;
  int cost;
  String createdAt;
  String updatedAt;

  categories(
      {this.id,
        this.name,
        this.type,
        this.duration,
        this.cost,
        this.createdAt,
        this.updatedAt});

  categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    duration = json['duration'];
    cost = json['cost'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['duration'] = this.duration;
    data['cost'] = this.cost;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}