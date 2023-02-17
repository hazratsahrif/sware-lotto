import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:wallet/app/routes/app_pages.dart';
import 'package:wallet/constant/colors.dart';
import 'package:wallet/utils/SnackBarUtils.dart';
import 'package:wallet/widgets/MyTextField.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
   SignupView({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController conPassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
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

            SizedBox(height: 10,),

            SingleChildScrollView(
              child: Column(
                children: [
                  MyTextField(hint: "Nickname", controller: nameController, valueChanged: (val){},
                   icons: Icons.person,
                    isObsecure: false,

                  ),
                  SizedBox(height: 8,),
                  MyTextField(hint: "Phone number", controller: phoneNoController, valueChanged: (val){},
                    icons: Icons.phone_android,
                    isObsecure: false,
                    textInputType: TextInputType.number,

                  ),
                  SizedBox(height: 8,),
                  MyTextField(hint: "Email address", controller: emailController, valueChanged: (val){},
                    icons: Icons.mail_rounded,
                    isObsecure: false,

                  ),
                  SizedBox(height: 8,),
                  MyTextField(hint: "Password", controller: passController, valueChanged: (val){},
                    icons: Icons.vpn_key_sharp,
                    isObsecure: true,

                  ),
                  SizedBox(height: 8,),
                  MyTextField(hint: "Confirm Password", controller: conPassController, valueChanged: (val){},
                    icons: Icons.vpn_key_sharp,
                    isObsecure: true,

                  ),
                  SizedBox(height: 20,),

                  Center(
                    child: MaterialButton(onPressed: (){

                      if(
                      conPassController.text.isNotEmpty ||
                      passController.text.isNotEmpty ||
                      emailController.text.isNotEmpty ||
                      phoneNoController.text.isNotEmpty ||
                      nameController.text.isNotEmpty ||
                      conPassController.text.isNotEmpty
                      ){
                        Map data ={

                          "nick_name": nameController.text,
                          "email":emailController.text,
                          "phone":phoneNoController.text,
                          "password":passController.text,
                          "password_confirmation":conPassController.text
                        };
                        controller.registerUserUser(data);

                      }
                      else{
                        SnackBarUtils.showError("Please fill all the field!");
                      }

                    }, child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 16),),
                      color: MyColor.yellow,
                      padding: EdgeInsets.symmetric(vertical: 14,horizontal: 20),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),

                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}
