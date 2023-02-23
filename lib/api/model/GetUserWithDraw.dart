import 'Withdraws.dart';

class GetUserWithDraw {
  GetUserWithDraw({
      this.success, 
      this.withdraws,});

  GetUserWithDraw.fromJson(dynamic json) {
    success = json['success'];
    if (json['withdraws'] != null) {
      withdraws = [];
      json['withdraws'].forEach((v) {
        withdraws!.add(Withdraws.fromJson(v));
      });
    }
  }
  bool? success;
  List<Withdraws>? withdraws;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (withdraws != null) {
      map['withdraws'] = withdraws!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}