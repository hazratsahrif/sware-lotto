import 'Deposits.dart';

class GetDepositResponse {
  GetDepositResponse({
      this.success, 
      this.deposits,});

  GetDepositResponse.fromJson(dynamic json) {
    success = json['success'];
    if (json['deposits'] != null) {
      deposits = [];
      json['deposits'].forEach((v) {
        deposits!.add(Deposits.fromJson(v));
      });
    }
  }
  bool? success;
  List<Deposits>? deposits;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (deposits != null) {
      map['deposits'] = deposits!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}