import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:http_parser/http_parser.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/profile/controllers/profile_controller.dart';
import 'package:wallet/utils/SnackBarUtils.dart';
import 'package:wallet/utils/easy_loading.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' hide Response, FormData, MultipartFile;
import 'package:get/get.dart' hide Response, FormData, MultipartFile,MediaType;

class SettingsController extends GetxController {
  //TODO: Implement SettingsController
  final profileController = ProfileController.instance;
  String? token="";
  RxString? depositImage ="".obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    token= profileController.token;
    profileController.img.value.name != null;
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
  void addReferalApiResponse(dynamic data,String url) async {
    print(data);
    print(token);


    try {
      Loading().showEasyLoading("loading...");
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
      var jsonResponse = json.decode(response.body);
      Loading().dismissEasyLoading();
      SnackBarUtils.showSnackBar(jsonResponse['message']);
    } on DioError catch (error) {
      print("nani kore ? : " + error.toString());
    }
  }
  /// Add referal code Api Call
  Future depositApiResponse(dynamic data,String url) async {
    print(data);
    print(token);
    print(url);

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

  /// withdraw code Api Call
  Future withDrawApiResponse(dynamic data,String url) async {

    print(data);
    print(token);
    print(url);
    try {
      Loading().showEasyLoading("loading...");

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
      SnackBarUtils.showSnackBar(jsonResponse['message']);
    } on DioError catch (error) {
      print("nani kore ? : " + error.toString());
    }
  }

  /// Deposit media api
  Future submitSubscription(dynamic data, String url)async {
    ///MultiPart request
    print(data.toString());
    dynamic responseJson;
    var res;
    String respStr = "screenshot";
    try {
      Loading().showEasyLoading("loading...");
      var response = http.MultipartRequest("POST", Uri.parse(url));
      print(data["screenshot"]);

      File file = File(data["screenshot"]);
      var length = await file.length();
      print(file.path);
      var stream = new http.ByteStream(file.openRead());
      print(file.path);
      var multiform = new http.MultipartFile(
          'file',
          stream,
          length,
          filename: file.path,
        contentType: new MediaType('image', 'jpg')
      );
      response.files.add(multiform);
      response.headers.addAll({
        "Content-type": "multipart/form-data",
        "Accept": "application/json",
        "Authorization": "Bearer $token",


      });
      response.fields.addAll({
        "amount":data['amount'],
        "reference":data['reference'],
        "screenshot":data["screenshot"],
      });
      res = await response.send();
      respStr = await res.stream.bytesToString();
      print("resposne");
      print(res.statusCode);
      print(res.request?.headers);
      print(respStr);
      Loading().easyLoadingSuccess();
    } on SocketException {
      throw ('No Internet Connection');
    }



  }

}
