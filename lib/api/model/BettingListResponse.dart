import 'Bets.dart';

class BettingListResponse {
  BettingListResponse({
       this.success,
       this.bets,});

  BettingListResponse.fromJson(dynamic json) {
    success = json['success'];
    if (json['bets'] != null) {
      bets = [];
      json['bets'].forEach((v) {
        bets!.add(Bets.fromJson(v));
      });
    }
  }
  bool? success;
  List<Bets>? bets;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (bets != null) {
      map['bets'] = bets!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}