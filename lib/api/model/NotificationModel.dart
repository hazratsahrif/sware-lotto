import 'Notifications.dart';

class NotificationModel {
  NotificationModel({
      this.success,
      this.notifications,});

  NotificationModel.fromJson(dynamic json) {
    success = json['success'];
    if (json['notifications'] != null) {
      notifications = [];
      json['notifications'].forEach((v) {
        notifications!.add(Notifications.fromJson(v));
      });
    }
  }
  bool? success;
  List<Notifications>? notifications;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    if (notifications != null) {
      map['notifications'] = notifications!.map((v) => v.toJson()).toList();
    }
    return map;
  }

}