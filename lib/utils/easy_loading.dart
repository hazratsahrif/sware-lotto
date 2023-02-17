import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class Loading {

  void showEasyLoading(String status){
    EasyLoading.show(status: status,dismissOnTap: true);
  }
  void dismissEasyLoading(){

    EasyLoading.dismiss();

  }
  void easyLoadingSuccess() {
    EasyLoading.init();
    EasyLoading.instance.backgroundColor = Colors.black;

    EasyLoading.showSuccess("Done",duration: Duration(seconds: 4),);

  }
}