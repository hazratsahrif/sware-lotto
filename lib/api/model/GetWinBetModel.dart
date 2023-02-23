import 'package:wallet/api/model/WinBets.dart';

import 'Bets.dart';

class GetWinBetModel {
  GetWinBetModel({
      this.success, 
      this.bets,});

  GetWinBetModel.fromJson(dynamic json) {
    success = json['success'];
    if (json['bets'] != null) {
      bets = [];
      json['bets'].forEach((v) {
        bets!.add(WinBets.fromJson(v));
      });
    }
  }
  bool? success;
  List<WinBets>? bets;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (bets != null) {
      map['bets'] = bets!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}