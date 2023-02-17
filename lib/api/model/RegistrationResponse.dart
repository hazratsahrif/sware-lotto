import 'dart:convert';
RegistrationResponse registrationResponseFromJson(String str) => RegistrationResponse.fromJson(json.decode(str));
String registrationResponseToJson(RegistrationResponse data) => json.encode(data.toJson());
class RegistrationResponse {
  RegistrationResponse({
      this.status,});

  RegistrationResponse.fromJson(dynamic json) {
    status = json['status'] != null ? Status.fromJson(json['status']) : null;
  }
  Status? status;
RegistrationResponse copyWith({  Status? status,
}) => RegistrationResponse(  status: status ?? this.status,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (status != null) {
      map['status'] = status?.toJson();
    }
    return map;
  }

}

Status statusFromJson(String str) => Status.fromJson(json.decode(str));
String statusToJson(Status data) => json.encode(data.toJson());
class Status {
  Status({
      this.code, 
      this.message,});

  Status.fromJson(dynamic json) {
    code = json['code'];
    message = json['message'];
  }
  int? code;
  String? message;
Status copyWith({  int? code,
  String? message,
}) => Status(  code: code ?? this.code,
  message: message ?? this.message,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['message'] = message;
    return map;
  }

}