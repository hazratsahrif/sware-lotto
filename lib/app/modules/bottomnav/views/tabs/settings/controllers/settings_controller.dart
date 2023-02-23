import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:http_parser/http_parser.dart';
import 'package:wallet/api/model/GetGcashModel.dart';
import 'package:wallet/api/model/GetUserWithDraw.dart';
import 'package:wallet/api/model/Withdraws.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/dashboard/bindings/dashboard_binding.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/dashboard/controllers/dashboard_controller.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/profile/controllers/profile_controller.dart';
import 'package:wallet/constant/api_url.dart';
import 'package:wallet/utils/FormatDate.dart';
import 'package:wallet/utils/SnackBarUtils.dart';
import 'package:wallet/utils/easy_loading.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio_lib;
import 'package:get/get.dart' hide Response, FormData, MultipartFile, MediaType;

class SettingsController extends GetxController {
  //TODO: Implement SettingsController
  final profileController = ProfileController.instance;
  final dashBoardController = DashboardController.instance;
  static SettingsController get instance => Get.put(SettingsController());
  Rx<GetUserWithDraw> userWithDrawResponse = GetUserWithDraw().obs;
  Rx<GetGcashModel> gCashResponse = GetGcashModel().obs;
  RxList<Withdraws> userWithDrawList = <Withdraws>[].obs;
  String? token = "";
  RxString? depositImage = "".obs;
  final date = new FormatCurrentDate();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    token = profileController.token;
    profileController.img.value.name != null;
    getWithDrawApiResponse();
    getGCashApiResponse();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  /// Add referal code Api Call
  void addReferalApiResponse(dynamic data, String url) async {
    print(data);
    print(token);

    try {
      Loading().showEasyLoading("loading...");
      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(data));
      print((response.body));
      var jsonResponse = json.decode(response.body);
      Loading().dismissEasyLoading();
      String message = jsonResponse['message'][0];


      if(message.contains("Attempt to read property \"is_referer\" on null")){
        SnackBarUtils.showSnackBar("Invalid Refferal Code");
      }else{
        SnackBarUtils.showSnackBar(message);
      }
    } on dio_lib.DioError catch (error) {
      print("nani kore ? : " + error.toString());
    }
  }

  /// Add referal code Api Call
  Future depositApiResponse(dynamic data, String url) async {
    print(data);
    print(token);
    print(url);
    try {
      Loading().easyLoadingSuccess();
      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(data));
      print(response.body);
      var jsonResponse = json.decode(response.body);
      Loading().dismissEasyLoading();
      SnackBarUtils.showSnackBar(jsonResponse['message'][0]);
    } on dio_lib.DioError catch (error) {
      print("nani kore ? : " + error.toString());
    }
  }

  /// withdraw code Api Call
  Future withDrawApiResponse(dynamic data, String url) async {
    print(data);
    print(token);
    print(url);
    // final dio = dio_lib.Dio();
    // try{
    //
    //   final response = await dio.post(
    //     url,
    //     data: jsonEncode(data),
    //     options: dio_lib.Options(headers: {
    //       "Content-type": "multipart/form-data",
    //       "Accept": "application/json",
    //       "Authorization": "Bearer $token",
    //     }),
    //   );
    //   print(response.data);
    //
    // }on SocketException{
    //   throw ("something went wrong");
    //
    // }

    try {
      Loading().showEasyLoading("loading...");

      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(data));
      print(response.body);
      var jsonResponse = json.decode(response.body);
      Loading().dismissEasyLoading();
      SnackBarUtils.showSnackBar(jsonResponse['message']);
    } on SocketException catch (error) {
      print("nani kore ? : " + error.toString());
    }
  }

  Future<dynamic> uploadImage(File file, String url, dynamic data) async {
    final dioObject = dio_lib.Dio();
    String fileName = file.path.split('/').last;
    dio_lib.FormData formData = dio_lib.FormData.fromMap({
      "screenshot":
          await dio_lib.MultipartFile.fromFile(file.path, filename: fileName),
      "amount": data['amount'],
      "reference": data['reference'],
    });
    print('Loading...');
    final response = await dioObject.post(
      url,
      data: formData,
      options: dio_lib.Options(headers: {
        "Content-type": "multipart/form-data",
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      }),
    );
    print(response);
    SnackBarUtils.showSnackBar(response.data['message'][0]);
    return response.data;
  }

  /// Deposit media api
  Future submitSubscription(dynamic data, String url) async {
    ///MultiPart request
    print(data.toString());
    print('submitSubscription');
    print('data["screenshot"]: ${data["screenshot"]}');

    try {
      Loading().showEasyLoading("loading...");
      final response = await uploadImage(File(data["screenshot"]), url, data);
      print('Response: ${response}');
      Loading().easyLoadingSuccess();
      return response;
    } on SocketException {
      throw ('No Internet Connection');
    }
  }

  /// Get List withdraw api
  Future getWithDrawApiResponse() async {
    print("token"+token.toString());
    try {
      Loading().easyLoadingSuccess();
      final response = await http.get(Uri.parse(ApiUrl.getUserWithDrawList),
        headers:
        {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      var jsonResponse = jsonDecode(response.body);
      userWithDrawResponse.value = GetUserWithDraw.fromJson(jsonResponse);
      print("user withdraw"+response.body);
      if(userWithDrawResponse.value.success!){
        userWithDrawList.value = userWithDrawResponse.value.withdraws!;

      };
      Loading().dismissEasyLoading();
    } on DioError catch (error) {
      print("nani kore ? : " + error.toString());
    }
  }

  /// Get Gcash  api
  Future getGCashApiResponse() async {
    print("token"+token.toString());
    try {
      Loading().easyLoadingSuccess();
      final response = await http.get(Uri.parse(ApiUrl.getGcashEndPoint),
        headers:
        {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      var jsonResponse = jsonDecode(response.body);
      gCashResponse.value = GetGcashModel.fromJson(jsonResponse);
      print("user withdraw"+response.body);
      if(gCashResponse.value.success!){
       print(gCashResponse.value.account!.number);

      };
      Loading().dismissEasyLoading();
    } on DioError catch (error) {
      print("nani kore ? : " + error.toString());
    }
  }
}
