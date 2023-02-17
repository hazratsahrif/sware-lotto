import 'package:wallet/api/data/network/BaseApiServices.dart';
import 'package:wallet/api/data/network/NetworkApiService.dart';
import 'package:wallet/constant/api_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  /// SignUP Api Call
  Future<dynamic> signUpUser(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.postSignUpApiResponse(data, ApiUrl.signUpEndPoint);
      return response;
    } catch (e) {
      throw e;
    }
  }

  /// Login Api Call
  Future<dynamic> loginUser(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.postLoginApiResponse(data, ApiUrl.loginEndPoint);
      return response;
    } catch (e) {
      throw e;
    }
  }

  /// Email verification Api Call
  Future<dynamic> verifyUser(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.postEmailVerificationResponse(ApiUrl.verificationEndPoint,data);
      return response;
    } catch (e) {
      throw e;
    }
  }



}
