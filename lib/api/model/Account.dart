class Account {
  Account({
      this.id, 
      this.name, 
      this.number, 
      this.createdAt, 
      this.updatedAt,});

  Account.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? number;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['number'] = number;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}