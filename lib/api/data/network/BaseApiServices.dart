abstract class BaseApiServices {
  Future<dynamic> postSignUpApiResponse(dynamic data, String url);
  Future<dynamic> postLoginApiResponse(dynamic data, String url);
  Future<dynamic> postEmailVerificationResponse(String url,dynamic data);

}
