import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wallet/app/modules/signup/controllers/signup_controller.dart';
import 'package:wallet/constant/api_url.dart';
import 'package:wallet/utils/SnackBarUtils.dart';
import 'package:wallet/widgets/PrimaryButton.dart';
import 'package:wallet/widgets/ProfileTextField.dart';

class ChangepasswordView extends GetView<SignupController> {
   ChangepasswordView({Key? key}) : super(key: key);
  TextEditingController currentController = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  final controller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,

      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        title: const Text('Change Password', style: TextStyle(color: Colors.black),),
      ),
      body: Stack(
        children: [
          Image.asset('assets/seetingbackground.png', fit: BoxFit.cover,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
                IntrinsicHeight(
                  child: Container(
                    padding: EdgeInsets.only(top: 9,left: 16,right: 16,bottom: 25),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 2,
                              blurStyle: BlurStyle.outer,
                              spreadRadius: 3
                          ),
                        ]
                    ),


                    child: Column(
                      children: [
                        ProfileTextField(
                          title: "Current Password",
                          suffixIcon: null,
                          controller: currentController,
                          textInputType: TextInputType.number,

                        ),
                        ProfileTextField(
                          title: "New Password",
                          suffixIcon: null,
                          controller: newController,
                          textInputType: TextInputType.text,
                        ),
                        ProfileTextField(
                          title: "Confirm New Password",
                          suffixIcon: null,
                          controller: confirmController,
                          textInputType: TextInputType.text,
                        ),

                      ],
                    ),

                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08,),

                PrimaryButton(title: "Update",onTab: (){

                  if(
                       currentController.text.isNotEmpty ||
                      newController.text.isNotEmpty ||
                      confirmController.text.isNotEmpty
                  ){
                    Map data ={

                      "old_password": currentController.text,
                      "password":newController.text,
                      "password_confirmation":confirmController.text
                    };
                    controller.changePasswordApiResponse(data,ApiUrl.changePasswordEndPoint);

                  }
                  else{
                    SnackBarUtils.showError("Please fill all the field!");
                  }
                },),


              ],
            ),
          ),

        ],
      ),
    );
  }
}
