import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:wallet/api/model/UserGetModel.dart';
import 'package:wallet/constant/api_url.dart';
import 'package:wallet/utils/ImagePicker.dart';
import 'package:wallet/utils/SnackBarUtils.dart';
import 'package:wallet/utils/easy_loading.dart';
class ProfileController extends GetxController {
  //TODO: Implement ProfileController

  static ProfileController get instance => Get.put(ProfileController());

  final storage = new FlutterSecureStorage();
  String? token="";
  String nick_name = "";
  Rx<UserGetModel>  userModel = new UserGetModel().obs;
  String image="";
  Rx<Users>  userData = new Users().obs;
  Rx<XFile> img = XFile('').obs;
  Rx<XFile> depositImage = XFile('').obs;
  Rx<ImagePicker> picker = ImagePicker().obs;

  @override
  void onInit() async{
    super.onInit();
    print("init call");
    print(userData.value.image.toString().replaceAll(RegExp(r'\\'),""));
    token = await storage.read(key: "token");
    if(token!.isNotEmpty){
      print(token);
      getUserData();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<String?> getFromGallery() async {
    img.value = (await picker.value.pickImage(
      source: ImageSource.gallery,
    ))!;
    if (img.value.name != null) {
      print(img.value.path);
      return img.value.path;
    } else {
      print("error");
    }
    return null;
  }
  @override
  void onClose() {
    super.onClose();
  }
    Future getUserData() async {
      http.Response response;
      try {
        response = await http.get(Uri.parse(ApiUrl.getUserEndPoint),
            headers:
        {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
        }).timeout(
          const Duration(seconds: 15),
        );
        print(response.body);
        if(response.body.isNotEmpty){
          print("not null");
          var responseData = json.decode(response.body);

          userModel.value =  UserGetModel.fromJson(responseData);
          userData.value = userModel.value.users!;
          print(userData.value.nickName);
        }
      } on SocketException {
        throw 'Something went wrong';
      }
      return response.body;
    }
  Future updateUserData(dynamic data,String url) async {
    // print(data);
    // print(token);
    // final msg = jsonEncode(data);
    // try {
    //   Loading().easyLoadingSuccess();
    //   http.Response response = await http.post(Uri.parse(url),
    //       headers:
    //       {
    //         'Content-Type': 'application/json',
    //         'Accept': 'application/json',
    //         'Authorization': 'Bearer $token',
    //       },
    //       body: msg
    //   );
    //   print((response.body));
    //   Loading().dismissEasyLoading();
    //   var jsonResponse = json.decode(response.body);
    //   onInit();
    //   SnackBarUtils.showSnackBar(jsonResponse['message'][0]);
    // } on DioError catch (error) {
    //   print("nani kore ? : " + error.toString());
    // }
    print(data['screenshot']);
    dynamic responseJson;
    var res;
    String respStr = "screenshot";
    try {
      Loading().showEasyLoading("loading...");
      var response = http.MultipartRequest("POST", Uri.parse(url));
      print(data["image"]);

      File file = File(data["image"]);
      var length = await file.length();
      print(file.path);
      var stream = new http.ByteStream(file.openRead());
      print("file"+file.path);
      var multiform = new http.MultipartFile(
          'image',
          stream,
          length,
          filename: file.path
      );

      response.files.add(multiform);
      response.headers.addAll({
        "Content-type": "application/json",
        "Accept": "application/json",
        "Authorization": "Bearer ${token}",
      });
      response.fields.addAll({
        "bio":data['bio'],
        "image":data['image'],
        "dob":data['dob'],
        "nick_name":data['nick_name'],
      });

      res = await response.send();
      respStr = await res.stream.bytesToString();
      print("resposne");
      print(res.statusCode);

      print(res.request?.headers);
      print(respStr);
      onInit();
      Loading().easyLoadingSuccess();
    } on SocketException {
      throw ('No Internet Connection');
    }


    return responseJson;

  }
}
