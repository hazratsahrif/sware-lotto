import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:wallet/api/data/network/BaseApiServices.dart';

class NetworkApiService extends BaseApiServices {
  // final token = GetStorage();

  var dio = Dio();

  // final http = InterceptedHttp.build(interceptors: [
  //   LoggingInterceptor(),
  // ]);
  /// Sign Up Api call
  @override
  Future postSignUpApiResponse(data, String url) async {
    print(data.toString());
    print(url);
    http.Response response;
    try {
      response = await http.post(Uri.parse(url), body: data).timeout(
            const Duration(seconds: 15),
          );
      print(response.body);
    } on SocketException {
      throw 'Something went wrong';
    }
    return response.body;
  }

  /// Login Up Api call
  @override
  Future postLoginApiResponse(data, String url) async {
    print(data.toString());
    http.Response response;
    try {
      response = await http.post(Uri.parse(url), body: data).timeout(
            const Duration(seconds: 30),
          );
      print(response.body);
    } on SocketException {
      throw 'No Internet Connection';
    }

    return response.body;
  }

  @override
  Future postEmailVerificationResponse(String url, data) async {
    dynamic response;
    try {
      response = await http.post(Uri.parse(url), body: data).timeout(
            const Duration(seconds: 20),
          );
      print("hazrat");
      print(response.body);
    } on SocketException {
      throw 'No Internet Connection';
    }
    return response.body;
  }
}
