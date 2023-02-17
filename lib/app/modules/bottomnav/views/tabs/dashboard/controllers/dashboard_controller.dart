import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/profile/controllers/profile_controller.dart';
import 'package:wallet/utils/SnackBarUtils.dart';
import 'package:wallet/utils/easy_loading.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  RxString? selectedItem ="".obs;
  final profileController = ProfileController.instance;
  final storage = new FlutterSecureStorage();
  String? token="";

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    token=await storage.read(key: "token");
    print(token);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future bettingApiResponse(dynamic data,String url) async {
    print("data"+data.toString());
    print("token"+token.toString());
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
      print(response.body);
      var jsonResponse = json.decode(response.body);
      Loading().dismissEasyLoading();
      SnackBarUtils.showSnackBar(jsonResponse['message'][0]);
    } on DioError catch (error) {
      print("nani kore ? : " + error.toString());
    }
  }
}
