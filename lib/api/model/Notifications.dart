import 'Users.dart';

class Notifications {
  Notifications({
      this.id, 
      this.userId, 
      this.title, 
      this.content, 
      this.createdAt, 
      this.updatedAt, 
      this.users,});

  Notifications.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    content = json['content'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    users = json['users'] != null ? Users.fromJson(json['users']) : null;
  }
  int? id;
  int? userId;
  String? title;
  String? content;
  String? createdAt;
  String? updatedAt;
  Users? users;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['title'] = title;
    map['content'] = content;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (users != null) {
      map['users'] = users!.toJson();
    }
    return map;
  }

}