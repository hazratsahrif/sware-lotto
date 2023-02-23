class Bets {
  Bets({
     required this.id,
     required this.userId,
     required this.date,
     required this.price,
     required this.bettingNumber,
     required this.status,
     required this.createdAt,
     required this.updatedAt,});

  Bets.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    date = json['date'];
    price = json['price'];
    bettingNumber = json['betting_number'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  int? userId;
  String? date;
  int? price;
  int? bettingNumber;
  int? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['date'] = date;
    map['price'] = price;
    map['betting_number'] = bettingNumber;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}