class UserWallet {
  UserWallet({
      this.id, 
      this.userId, 
      this.balance, 
      this.bones, 
      this.date, 
      this.isBones, 
      this.createdAt, 
      this.updatedAt,});

  UserWallet.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    balance = json['balance'];
    bones = json['bones'];
    date = json['date'];
    isBones = json['is_bones'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? userId;
  int? balance;
  int? bones;
  int? date;
  int? isBones;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['balance'] = balance;
    map['bones'] = bones;
    map['date'] = date;
    map['is_bones'] = isBones;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}