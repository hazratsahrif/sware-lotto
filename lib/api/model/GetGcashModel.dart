import 'Account.dart';

class GetGcashModel {
  GetGcashModel({
      this.success, 
      this.account,});

  GetGcashModel.fromJson(dynamic json) {
    success = json['success'];
    account = json['account'] != null ? Account.fromJson(json['account']) : null;
  }
  bool? success;
  Account? account;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (account != null) {
      map['account'] = account!.toJson();
    }
    return map;
  }

}