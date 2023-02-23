import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:wallet/api/model/ResetPassword.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/views/changepassword_view.dart';
import 'package:wallet/app/modules/signup/controllers/signup_controller.dart';
import 'package:wallet/app/modules/signup/views/forgotpassword_view.dart';
import 'package:wallet/app/modules/signup/views/passworcode_view.dart';
import 'package:wallet/app/routes/app_pages.dart';
import 'package:wallet/constant/api_url.dart';
import 'package:wallet/constant/colors.dart';
import 'package:wallet/utils/SnackBarUtils.dart';
import 'package:wallet/utils/easy_loading.dart';
import 'package:wallet/widgets/MyTextField.dart';
import 'package:http/http.dart' as http;

class PasswordemailView extends GetView<SignupController> {
   PasswordemailView({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   backgroundColor: MyColor.background,
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(right: 12),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.2,

              child: SvgPicture.asset("assets/Circle.svg",color: MyColor.yellow,

                fit: BoxFit.fill,
              )),


          Spacer(),
          MyTextField(hint: "Email address", controller: emailController, valueChanged: (val){},
            icons: Icons.email,
            isObsecure: false,

          ),
          Spacer(),
          Center(
            child:   MaterialButton(onPressed: (){
              if(emailController.text.isNotEmpty){
                ResetPassword data = new ResetPassword(email: emailController.text);

                // Map data =
                // {
                //   "email":emailController.text
                // };
                print("hazrat gull");
                print(data.toJson());
                postSendCodeApiResponseHttp(data.toJson(),ApiUrl.resetPasswordEndPoint);
                emailController.text='';

              }
              else{
                SnackBarUtils.showError("Please fill all the field!");
              }

              // Get.to(PassworcodeView());
            }, child: Icon(Icons.arrow_forward_rounded,size: 30, color: Colors.white,),
              color: MyColor.yellow,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),

            ),
          ),
          Spacer(),

        ],
      ),
    );
  }
   void postSendCodeApiResponseHttp(dynamic data,String url) async {
     Loading().showEasyLoading("loading...");
     print("data"+ data.toString());
     try {
       final response = await http.post(Uri.parse(url),
           body: data
       );
       var jsonResponse = jsonDecode(response.body);
       String message = jsonResponse['message'][0];
       print((response.body));
       SnackBarUtils.showSnackBar(message);
       Loading().easyLoadingSuccess();
       if(message.contains("Check your mail for reset password")){
         Get.to(()=>PassworcodeView(),arguments: true);

       }
       else{
         ///nothing
       }

     } on DioError catch (error) {
       print("nani kore ? : " + error.toString());
     }
   }
}
