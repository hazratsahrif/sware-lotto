class UserGetModel {
  UserGetModel({
      this.users, 
      this.success,});

  UserGetModel.fromJson(dynamic json) {
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
    success = json['success'];
  }
  Users? users;
  bool? success;
UserGetModel copyWith({  Users? users,
  bool? success,
}) => UserGetModel(  users: users ?? this.users,
  success: success ?? this.success,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (users != null) {
      map['users'] = users?.toJson();
    }
    map['success'] = success;
    return map;
  }

}

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
  dynamic bio;
  dynamic dob;
  dynamic image;
  String? referralCode;
Users copyWith({  int? id,
  String? nickName,
  String? email,
  String? emailVerifiedAt,
  int? isVerified,
  String? phone,
  String? code,
  String? createdAt,
  String? updatedAt,
  dynamic bio,
  dynamic dob,
  dynamic image,
  String? referralCode,
}) => Users(  id: id ?? this.id,
  nickName: nickName ?? this.nickName,
  email: email ?? this.email,
  emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
  isVerified: isVerified ?? this.isVerified,
  phone: phone ?? this.phone,
  code: code ?? this.code,
  createdAt: createdAt ?? this.createdAt,
  updatedAt: updatedAt ?? this.updatedAt,
  bio: bio ?? this.bio,
  dob: dob ?? this.dob,
  image: image ?? this.image,
  referralCode: referralCode ?? this.referralCode,
);
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
    map['referral_code'] = referralCode;
    return map;
  }

}