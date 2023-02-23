class Deposits {
  Deposits({
      this.id, 
      this.userId, 
      this.amount, 
      this.reference, 
      this.image, 
      this.status, 
      this.createdAt, 
      this.updatedAt,});

  Deposits.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    amount = json['amount'];
    reference = json['reference'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? userId;
  String? amount;
  String? reference;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['amount'] = amount;
    map['reference'] = reference;
    map['image'] = image;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}