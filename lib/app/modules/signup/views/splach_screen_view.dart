import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:wallet/app/modules/signup/controllers/signup_controller.dart';

class SplachScreenView extends GetView<SignupController> {
   SplachScreenView({Key? key}) : super(key: key);
  final controller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    controller.isLogedIn();
    return Scaffold(
      body: Center(child: Image.asset("assets/lotereto.png", width: MediaQuery.of(context).size.width/3,),),
    );
  }
}
