import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:wallet/api/model/LoginResponse.dart';
import 'package:wallet/api/respository/auth_repository.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/views/changepassword_view.dart';
import 'package:wallet/app/modules/signup/views/passworcode_view.dart';
import 'package:wallet/app/routes/app_pages.dart';
import 'package:wallet/utils/SnackBarUtils.dart';
import 'package:wallet/utils/easy_loading.dart';
import 'package:http/http.dart' as http;
class SignupController extends GetxController {
  //TODO: Implement SignupController
  final _myRepo = AuthRepository();
  final storage = new FlutterSecureStorage();
  String? token="";


  final count = 0.obs;
  @override
  void onInit() async{
    super.onInit();
    token = await storage.read(key: "token");
    print(token);
    if(token!.isNotEmpty){
      Get.toNamed(Routes.BOTTOMNAV);

    }
    else{
      Get.toNamed(Routes.LOGIN);
    }

  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> registerUserUser(dynamic data) async {

    Loading().showEasyLoading("loading...");

    _myRepo.signUpUser(data).then((value) async {
      var responseData = json.decode(value);

      String message =responseData['message'][0];

      if(message.contains("The email has already been taken.") ){
        Get.to(()=>PassworcodeView());
      }
      else{
        await SnackBarUtils.showSnackBar("Check your mail, Registration Successfully");
        Get.to(()=> PassworcodeView());
      }

      Loading().easyLoadingSuccess();
    }).onError((error, stackTrace){
      Loading().dismissEasyLoading();
      // if(error.toString()== ApiResponseResult.signUpUserAlreadyExist){
      SnackBarUtils.showError(error.toString());
      // }
      print("hazrat jani${error.toString()}");

    });
  }

  Future<void> postLoginUser(dynamic data) async {

    Loading().showEasyLoading("loading...");
    _myRepo.loginUser(data).then((value) async {
      var responseData = json.decode(value);
      LoginResponse response = LoginResponse.fromJson(responseData);
      print("response hazrat"+response.success.toString());
      String message =responseData['message'][0];
      if(message.contains("Please verified user email")){
        await SnackBarUtils.showSnackBar(message);
        Get.toNamed(Routes.PASSWORDCODE);
      }
      else if(message.contains("Invalid Email and password")){
        await SnackBarUtils.showSnackBar(message);
      }
      else{
        token= responseData['token'];
        print(token);
        await storage.write(key: "token", value: token);
        String? mytoken =await storage.read(key: "token");
        print("token "+mytoken.toString());
        Get.toNamed(Routes.BOTTOMNAV);
      }


      Loading().easyLoadingSuccess();
    }).onError((error, stackTrace){
      Loading().dismissEasyLoading();
      // if(error.toString()== ApiResponseResult.signUpUserAlreadyExist){
      SnackBarUtils.showError(error.toString());
      // }
      print("hazrat jani${error.toString()}");

    });
  }
  Future<void> postVerifyUser(dynamic data) async {
    print(data);
    print("huzaidfa");
    Loading().showEasyLoading("loading...");
    _myRepo.verifyUser(data).then((value) async {
      var responseData = json.decode(value);
      print(responseData);
      String message =responseData['message'][0];
      print("message"+message);
      await SnackBarUtils.showSnackBar(message);
      if(message.contains("Please verified user email") ){
        await SnackBarUtils.showSnackBar(message);
        Get.toNamed(Routes.PASSWORDCODE);

      }
      else {
        Get.toNamed(Routes.LOGIN);
      }
      Loading().easyLoadingSuccess();
    }).onError((error, stackTrace){
      Loading().dismissEasyLoading();
      // if(error.toString()== ApiResponseResult.signUpUserAlreadyExist){
      SnackBarUtils.showError(error.toString());
      // }
      print("hazrat jani${error.toString()}");

    });
  }

  /// Reset password Api Call
  void getHttp(dynamic data,String url) async {
    Loading().showEasyLoading("loading...");
    try {
      var response = await Dio().post(url, data: data);
      String message = response.data['message'][0];
      print("response message "+message.toString());

      Loading().dismissEasyLoading();
      if(message=="Check your mail for reset password"){
        SnackBarUtils.showSnackBar(message);
        Get.to(()=> ChangepasswordView());
      }
      else{
        SnackBarUtils.showSnackBar(response.statusMessage!);
      }
    } catch (e) {
      print(e);
    }
  }

  /// Change password Api Call
  void changePasswordApiResponse(dynamic data,String url) async {
    print(data);
    print(token);

    try {
      Loading().easyLoadingSuccess();
      final response = await http.post(Uri.parse(url),
          headers:
           {
             'Content-Type': 'application/json',
             'Accept': 'application/json',
             'Authorization': 'Bearer $token',
          },
        body: jsonEncode(data)
      );
      print((response.body));
      Loading().easyLoadingSuccess();
        SnackBarUtils.showSnackBar(response.body);
    } on DioError catch (error) {
        print("nani kore ? : " + error.toString());
  }
  }




}
