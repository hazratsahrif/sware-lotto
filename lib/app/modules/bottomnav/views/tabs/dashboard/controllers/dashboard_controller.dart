import 'dart:convert';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wallet/api/model/Bets.dart';
import 'package:wallet/api/model/BettingListResponse.dart';
import 'package:wallet/api/model/Deposits.dart';
import 'package:wallet/api/model/GetDepositResponse.dart';
import 'package:wallet/api/model/GetWinBetModel.dart';
import 'package:wallet/api/model/NotificationModel.dart';
import 'package:wallet/api/model/Notifications.dart';
import 'package:wallet/api/model/UserWallet.dart';
import 'package:wallet/api/model/UserWalletModel.dart';
import 'package:wallet/api/model/WinBets.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/profile/controllers/profile_controller.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/controllers/settings_controller.dart';
import 'package:wallet/constant/api_url.dart';
import 'package:wallet/utils/FormatDate.dart';
import 'package:wallet/utils/SnackBarUtils.dart';
import 'package:wallet/utils/easy_loading.dart';
import 'package:http/http.dart' as http;

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  RxString? selectedItem ="".obs;
  RxInt endTime =0.obs;

  Rx<Color> focusColor = Color(0xffFF0000).obs;
  Rx<Color> enableColor = Color(0xFF00B0FF).obs;
  RxBool isLoading = true.obs;

  final profileController = ProfileController.instance;
  static DashboardController get instance => Get.put(DashboardController());
  final storage = new FlutterSecureStorage();
  final date = new FormatCurrentDate();
  Rx<BettingListResponse> bettingResponse = BettingListResponse().obs;
  RxList<Bets> bettingList = <Bets>[].obs;
  RxList<Bets> filterList = <Bets>[].obs;
  Rx<GetDepositResponse> getDepositResponse = GetDepositResponse().obs;
  RxList<Deposits> depositList = <Deposits>[].obs;
  RxBool isProgress = true.obs;

  Rx<UserWalletModel> userWalletResponse = UserWalletModel().obs;
  Rx<UserWallet> userWalletList = UserWallet().obs;

  Rx<NotificationModel> notificationResponse = NotificationModel().obs;
  RxList<Notifications> notificationList = <Notifications>[].obs;

  Rx<GetWinBetModel> getWinBetResponse = GetWinBetModel().obs;
  RxList<WinBets> winBetsList = <WinBets>[].obs;
  String? token="";

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    token=await storage.read(key: "token");
    print(token);
    depositList.value=[];
    getBettingListApiResponse();
    getDepositApiResponse();
    getNotificationApiResponse();
    userWalletApiResponse();
    getWinBetApiResponse();
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
      getBettingListApiResponse();
      userWalletApiResponse();
      var jsonResponse = json.decode(response.body);
      Loading().dismissEasyLoading();
      SnackBarUtils.showSnackBar(jsonResponse['message'][0]);
    } on DioError catch (error) {
      print("nani kore ? : " + error.toString());
    }
  }
  Future getBettingListApiResponse() async {
    print("token"+token.toString());
     isProgress.value = true;

    try {
      Loading().easyLoadingSuccess();
      final response = await http.get(Uri.parse(ApiUrl.getListEndPoint),
          headers:
          {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
      );
      var jsonResponse = jsonDecode(response.body);
      bettingResponse.value = BettingListResponse.fromJson(jsonResponse);
      print(response.body);
      if(bettingResponse.value.success!){
        bettingList.value = bettingResponse.value.bets!;
        DateFormat dateFormat = DateFormat("dd");
        String string = dateFormat.format(DateTime.now());
        print(string);
         filterList.value = bettingList.value.where((element) => DateFormat("dd").format(DateTime.parse(element.createdAt.toString()))==string).toList();
        isProgress.value = false;

        print(DateFormat("dd").format(DateTime.parse(bettingList[0].createdAt.toString())));


      };
      Loading().dismissEasyLoading();
    } on DioError catch (error) {
      print("nani kore ? : " + error.toString());
    }
  }
  Future userWalletApiResponse() async {
    print("token"+token.toString());
    try {
      Loading().easyLoadingSuccess();
      final response = await http.get(Uri.parse(ApiUrl.userwalletEndPoint),
          headers:
          {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
      );
      var jsonResponse = jsonDecode(response.body);
      userWalletResponse.value = UserWalletModel.fromJson(jsonResponse);
      print(response.body);
      if(userWalletResponse.value.success!){
        userWalletList.value = userWalletResponse.value.userWallet!;

      };
      Loading().dismissEasyLoading();
    } on DioError catch (error) {
      print("nani kore ? : " + error.toString());
    }
  }
  Future getDepositApiResponse() async {
    print("token"+token.toString());
    try {
      Loading().easyLoadingSuccess();
      final response = await http.get(Uri.parse(ApiUrl.getDepositEndPoint),
        headers:
        {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      var jsonResponse = jsonDecode(response.body);
      getDepositResponse.value = GetDepositResponse.fromJson(jsonResponse);
      print(response.body);
      if(getDepositResponse.value.success!){
        depositList.value = getDepositResponse.value.deposits!;

      };
      Loading().dismissEasyLoading();
    } on DioError catch (error) {
      print("nani kore ? : " + error.toString());
    }
  }
  Future getNotificationApiResponse() async {
    print("token"+token.toString());
    try {
      Loading().easyLoadingSuccess();
      final response = await http.get(Uri.parse(ApiUrl.getUserNotifications),
        headers:
        {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      var jsonResponse = jsonDecode(response.body);
      notificationResponse.value = NotificationModel.fromJson(jsonResponse);
      print("Notifications"+response.body);
      if(notificationResponse.value.success!){
        notificationList.value = notificationResponse.value.notifications!;

      };
      Loading().dismissEasyLoading();
    } on DioError catch (error) {
      print("nani kore ? : " + error.toString());
    }
  }

  /// Get win bets
  Future getWinBetApiResponse() async {
    isLoading.value=true;
    print("token"+token.toString());
    print("get Api win called");
    try {
      Loading().easyLoadingSuccess();
      final response = await http.get(Uri.parse(ApiUrl.getWinBetEndPoint),
        headers:
        {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      isLoading.value=false;
      print("end calles");
      var jsonResponse = jsonDecode(response.body);
      getWinBetResponse.value = GetWinBetModel.fromJson(jsonResponse);
      print(response.body);
      if(getWinBetResponse.value.success!){
        print("success");
        winBetsList.value = getWinBetResponse.value.bets!;


      };
      Loading().dismissEasyLoading();
    } on DioError catch (error) {
      print("nani kore ? : " + error.toString());
    }
  }
}
