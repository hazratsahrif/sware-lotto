import 'Users.dart';

class Withdraws {
  Withdraws({
      this.id, 
      this.userId, 
      this.amount, 
      this.accountNumber, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.users,});

  Withdraws.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    amount = json['amount'];
    accountNumber = json['account_number'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
  }
  int? id;
  int? userId;
  int? amount;
  String? accountNumber;
  int? status;
  String? createdAt;
  String? updatedAt;
  Users? users;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['amount'] = amount;
    map['account_number'] = accountNumber;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (users != null) {
      map['users'] = users!.toJson();
    }
    return map;
  }

}