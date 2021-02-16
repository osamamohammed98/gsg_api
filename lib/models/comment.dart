class Comment {
  String productId;
  String comment;
  CommentUser user;

  Comment({this.productId, this.comment, this.user});

  Comment.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    comment = json['comment'];
    user = json['user'] != null ? new CommentUser.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['comment'] = this.comment;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class CommentUser {
  String sId;
  String username;
  String email;
  String phone;
  String instagram;
  String fullName;
  String country;
  String city;
  String avatar;
  String lastLoginAt;
  String role;
  String status;
  String language;
  String createdAt;
  String updatedAt;
  String bankName;
  String ipan;
  String bankUserName;
  String licenseUrl;
  String companyType;

  CommentUser(
      {this.sId,
      this.username,
      this.email,
      this.phone,
      this.instagram,
      this.fullName,
      this.country,
      this.city,
      this.avatar,
      this.lastLoginAt,
      this.role,
      this.status,
      this.language,
      this.createdAt,
      this.updatedAt,
      this.bankName,
      this.ipan,
      this.bankUserName,
      this.licenseUrl,
      this.companyType});

  CommentUser.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    instagram = json['instagram'];
    fullName = json['fullName'];
    country = json['country'];
    city = json['city'];
    avatar = json['avatar'];
    lastLoginAt = json['lastLoginAt'];
    role = json['role'];
    status = json['status'];
    language = json['language'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    bankName = json['bankName'];
    ipan = json['ipan'];
    bankUserName = json['bankUserName'];
    licenseUrl = json['licenseUrl'];
    companyType = json['companyType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['instagram'] = this.instagram;
    data['fullName'] = this.fullName;
    data['country'] = this.country;
    data['city'] = this.city;
    data['avatar'] = this.avatar;
    data['lastLoginAt'] = this.lastLoginAt;
    data['role'] = this.role;
    data['status'] = this.status;
    data['language'] = this.language;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['bankName'] = this.bankName;
    data['ipan'] = this.ipan;
    data['bankUserName'] = this.bankUserName;
    data['licenseUrl'] = this.licenseUrl;
    data['companyType'] = this.companyType;
    return data;
  }
}
