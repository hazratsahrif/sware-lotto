class WinBets{


  int? id;
  int? time ;
  int? bet_number;
  String? created_at;
  String? updated_at;

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "time": this.time,
      "bet_number": this.bet_number,
      "created_at": this.created_at,
      "updated_at": this.updated_at,
    };
  }


  WinBets({ this.id, this.time, this.bet_number, this.created_at, this.updated_at});

  factory WinBets.fromJson(Map<String, dynamic> json) {
    return WinBets(
      id: int.parse(json["id"].toString()),
      time: int.parse(json["time"].toString()),
      bet_number: int.parse(json["bet_number"].toString()),
      created_at: json["created_at"],
      updated_at: json["updated_at"],
    );
  }
//

}