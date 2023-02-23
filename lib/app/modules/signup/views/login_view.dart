import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/views/changepassword_view.dart';
import 'package:wallet/app/modules/signup/controllers/signup_controller.dart';
import 'package:wallet/app/modules/signup/views/passwordemail_view.dart';
import 'package:wallet/app/modules/signup/views/signup_view.dart';
import 'package:wallet/app/routes/app_pages.dart';
import 'package:wallet/constant/colors.dart';
import 'package:wallet/utils/SnackBarUtils.dart';
import 'package:wallet/widgets/MyTextField.dart';

class LoginView extends GetView<SignupController> {
  LoginView({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final controller = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {

      return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor:  MyColor.background,

          body:
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(right: 12),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.2,

                    child: SvgPicture.asset(
                      "assets/Circle.svg", color: MyColor.yellow,

                      fit: BoxFit.fill,
                    )),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Welcome\nBack!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w600),
                  ),
                ),


                MyTextField(hint: "Enter Email",
                  controller: emailController,
                  valueChanged: (val) {},
                  icons: Icons.person,
                  isObsecure: false,

                ),
                SizedBox(height: 8,),
                MyTextField(hint: "Enter Password",
                  controller: passController,
                  valueChanged: (val) {},
                  icons: Icons.vpn_key_sharp,
                  isObsecure: true,

                ),
                InkWell(
                  onTap: () {},
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => PasswordemailView());
                        },
                        child: Text(
                          "FORGOT PASSWORD?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              decoration: TextDecoration.underline
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 34),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(onPressed: () {
                        Get.to(()=>SignupView());
                      }, child: Text(

                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            decoration: TextDecoration.underline

                        ),
                      )),
                      MaterialButton(onPressed: () {
                        if (
                        passController.text.isNotEmpty ||
                            emailController.text.isNotEmpty) {
                          Map data = {
                            "email": emailController.text,
                            "password": passController.text
                          };
                          controller.postLoginUser(data);
                        }
                        else {
                          SnackBarUtils.showError("Please fill all the field!");
                        }
                      },
                        child: Icon(Icons.arrow_forward_rounded, size: 30,
                          color: Colors.white,),
                        color: MyColor.yellow,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius
                            .circular(100)),

                      )
                    ],
                  ),
                )

              ],
            ),
          )

      );
  }
}
