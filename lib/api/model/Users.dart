class Users {
  Users({
      this.id, 
      this.nickName, 
      this.email, 
      this.emailVerifiedAt, 
      this.isVerified, 
      this.phone, 
      this.code, 
      this.createdAt, 
      this.updatedAt, 
      this.bio, 
      this.dob, 
      this.image, 
      this.isReferer, 
      this.referralCode,});

  Users.fromJson(dynamic json) {
    id = json['id'];
    nickName = json['nick_name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    isVerified = json['is_verified'];
    phone = json['phone'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bio = json['bio'];
    dob = json['dob'];
    image = json['image'];
    isReferer = json['is_referer'];
    referralCode = json['referral_code'];
  }
  int? id;
  String? nickName;
  String? email;
  String? emailVerifiedAt;
  int? isVerified;
  String? phone;
  String? code;
  String? createdAt;
  String? updatedAt;
  String? bio;
  String? dob;
  String? image;
  int? isReferer;
  String? referralCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['nick_name'] = nickName;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['is_verified'] = isVerified;
    map['phone'] = phone;
    map['code'] = code;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['bio'] = bio;
    map['dob'] = dob;
    map['image'] = image;
    map['is_referer'] = isReferer;
    map['referral_code'] = referralCode;
    return map;
  }

}