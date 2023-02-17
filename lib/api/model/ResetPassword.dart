class ResetPassword {
  ResetPassword({
      this.email,});

  ResetPassword.fromJson(dynamic json) {
    email = json['email'];
  }
  String? email;
ResetPassword copyWith({  String? email,
}) => ResetPassword(  email: email ?? this.email,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    return map;
  }

}