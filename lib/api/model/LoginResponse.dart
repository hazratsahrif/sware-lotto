class LoginResponse {
  LoginResponse({
      required this.success,
      required this.token,
      required this.message,});

  LoginResponse.fromJson(dynamic json) {
    success = json['success'];
    token = json['token'];
    message = json['message'] != null ? json['message'].cast<String>() : [];
  }
  bool? success;
  String? token;
  List<String>? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['token'] = token;
    map['message'] = message;
    return map;
  }

}