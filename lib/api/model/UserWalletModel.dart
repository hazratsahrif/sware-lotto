import 'UserWallet.dart';

class UserWalletModel {
  UserWalletModel({
      this.success, 
      this.userWallet,});

  UserWalletModel.fromJson(dynamic json) {
    success = json['success'];
    userWallet = json['user_wallet'] != null ? UserWallet.fromJson(json['user_wallet']) : null;
  }
  bool? success;
  UserWallet? userWallet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (userWallet != null) {
      map['user_wallet'] = userWallet!.toJson();
    }
    return map;
  }

}