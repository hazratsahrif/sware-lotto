class RegistrationModel {
  final String? user_name, user_email, user_country, user_mobile, user_whatsapp,
      user_password, user_cpassword;

  RegistrationModel({
     required this.user_name,
    required this.user_email,
    required this.user_country,
    required this.user_mobile,
    required this.user_whatsapp,
    required this.user_password,
    required this.user_cpassword});

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(
      user_name: json["user_name"],
      user_email: json["user_email"],
      user_country: json["user_country"],
      user_mobile: json["user_mobile"],
      user_whatsapp: json["user_whatsapp"],
      user_password: json["user_password"],
      user_cpassword: json["user_cpassword"],
    );

  }

  Map<String, dynamic> toJson() {
    return {
      "user_name": this.user_name,
      "user_email": this.user_email,
      "user_country": this.user_country,
      "user_mobile": this.user_mobile,
      "user_whatsapp": this.user_whatsapp,
      "user_password": this.user_password,
      "user_cpassword": this.user_cpassword,
    };
  }
//

}