import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:wallet/api/model/LoginResponse.dart';
import 'package:wallet/api/respository/auth_repository.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/views/changepassword_view.dart';
import 'package:wallet/app/modules/signup/views/login_view.dart';
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
  RxBool isSplash = true.obs;


  final count = 0.obs;
  @override
  void onInit() async{
    super.onInit();
    print("onint");
  }

  @override
  void onReady() {
    super.onReady();
  }


  Future<void> registerUserUser(dynamic data) async {

    Loading().showEasyLoading("loading...");

    _myRepo.signUpUser(data).then((value) async {
      var responseData = json.decode(value);
      print(responseData);
      print(value);

      String message =responseData['message'][0];
      print(message);

      if(message.contains("The email has already been taken.") ){
        await SnackBarUtils.showSnackBar(message);
      }
      else{
        await SnackBarUtils.showSnackBar(message);
        Get.to(()=> PassworcodeView(),arguments: false);
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
        Get.offNamed(Routes.BOTTOMNAV);
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
      String tokened =responseData['token'];
      print("message"+message);
      await SnackBarUtils.showSnackBar(message);
      if(message.contains("Please verified user email") ){
        await SnackBarUtils.showSnackBar(message);
        Get.toNamed(Routes.PASSWORDCODE);

      }
      else if(message.contains("Invalid Verification code")) {
        await SnackBarUtils.showSnackBar(message);
      }
      else{

        await storage.write(key: "token", value: tokened);
        token = await storage.read(key: "token");

        Get.offNamed(Routes.LOGIN);
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

  Future<void> postVerifyPassCode(dynamic data,String url) async {
      Loading().showEasyLoading("loading...");
      print("data"+ data.toString());
      try {
        final response = await http.post(Uri.parse(url),
            body: data);

        Loading().easyLoadingSuccess();
        var jsonResponse = jsonDecode(response.body);
        String message = jsonResponse['message'][0];
        bool status = jsonResponse['success'];
        if(status){
          String tokenRes = jsonResponse['token'];
          print("My token"+token.toString());
           await storage.write(key: 'token', value: tokenRes);
          token = await storage.read(key: 'token');
          print("storage token"+token.toString());
          print((response.body));
          Loading().easyLoadingSuccess();
          SnackBarUtils.showSnackBar(message);
          Get.offNamed(Routes.FORGOTPASS);
        }
        else{
          SnackBarUtils.showSnackBar(message);
        }

      } on DioError catch (error) {
        print("nani kore ? : " + error.toString());
      }
  }

  /// Reset password Api Call
  // void postSendCodeApiResponseHttp(String data,String url) async {
  //   Loading().showEasyLoading("loading...");
  //   print("data"+ data);
  //   try {
  //     Loading().easyLoadingSuccess();
  //     final response = await http.post(Uri.parse(url),
  //         headers:
  //         {
  //           'Content-Type': 'application/json',
  //           'Accept': 'application/json',
  //           'Authorization': 'Bearer ${"49|bAUZZ7KKOHvKSN7HxyrcjGGWwe1xe0J0mWFv5un0"}',
  //         },
  //         body: data
  //     );
  //     var jsonResponse = jsonDecode(response.body);
  //     print((response.body));
  //     Loading().easyLoadingSuccess();
  //     SnackBarUtils.showSnackBar(jsonResponse['message'][0]);
  //   } on DioError catch (error) {
  //     print("nani kore ? : " + error.toString());
  //   }
  // }

  /// Change password Api Call
  void changePasswordApiResponse(dynamic data,String url) async {
    print(data);
    print(token);
    token = await storage.read(key: "token");

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
      var jsonResponse = jsonDecode(response.body);
      print((response.body));
      Loading().easyLoadingSuccess();
        SnackBarUtils.showSnackBar(jsonResponse['message'][0]);
    } on DioError catch (error) {
        print("nani kore ? : " + error.toString());
  }
  }


  void isLogedIn() async{
    isSplash.value = true;
    token = await storage.read(key: "token");
    print(token);
    print("after token");
    if(token==null){
      Future.delayed(Duration(seconds: 2),(){
        isSplash.value = false;
        Get.offNamed(Routes.LOGIN);
      });
    }
    else{
      Future.delayed(Duration(seconds: 2),(){
        Get.offNamed(Routes.BOTTOMNAV);
      });
    }
  }

  /// Change password Api Call
  void resetPasswordApiResponse(dynamic data,String url) async {
    Loading().showEasyLoading("loading...");
    print(data.toString());
    token = await storage.read(key: "token");
    print(token);
    try {

      final response = await http.post(Uri.parse(url),
          headers:
          {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(data)
      );
      Loading().easyLoadingSuccess();
      var jsonResponse = jsonDecode(response.body);
      String message = jsonResponse['message'][0];
      print((response.body));
      Loading().easyLoadingSuccess();
      SnackBarUtils.showSnackBar(message);
      if(message.contains("Password Change Successfully")){
        Get.offAll(()=>LoginView());

      }
      ;
    } on DioError catch (error) {
      print("nani kore ? : " + error.toString());
    }
  }

}

