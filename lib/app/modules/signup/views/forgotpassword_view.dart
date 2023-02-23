import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:wallet/app/modules/signup/controllers/signup_controller.dart';
import 'package:wallet/constant/api_url.dart';
import 'package:wallet/constant/colors.dart';
import 'package:wallet/utils/SnackBarUtils.dart';
import 'package:wallet/widgets/MyTextField.dart';

class ForgotpasswordView extends GetView<SignupController> {
   ForgotpasswordView({Key? key}) : super(key: key);
  TextEditingController passController = TextEditingController();
  TextEditingController currentController = TextEditingController();
  TextEditingController conPassController = TextEditingController();
  final controller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: MyColor.background,

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
            // MyTextField(hint: "Current Password", controller: currentController, valueChanged: (val){},
            //   icons: Icons.key,
            //   isObsecure: false,
            //
            // ),
            MyTextField(hint: "Password", controller: passController, valueChanged: (val){},
              icons: Icons.key,
              isObsecure: false,

            ),
            SizedBox(height: 8,),
            MyTextField(hint: "Confirm Password", controller: conPassController, valueChanged: (val){},
              icons: Icons.key,
              isObsecure: false,

            ),
            Spacer(),


            Center(
              child: MaterialButton(onPressed: (){
                if(  passController.text.isNotEmpty && conPassController.text.isNotEmpty){
                  Map data=
                  {
                    "password":passController.text,
                    "password_confirmation":conPassController.text
                  };
                  controller.resetPasswordApiResponse(data, ApiUrl.changePasswordEndPoint);
                  // passController.text='';
                  conPassController.text='';
                  currentController.text='';



                }
                else{
                  SnackBarUtils.showError("Please fill all the field!");
                }


              }, child: Text("Login",style: TextStyle(color: Colors.white,fontSize: 16),),
                color: MyColor.yellow,
                padding: EdgeInsets.symmetric(vertical: 14,horizontal: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),

              ),
            ),
            SizedBox(height: 30,),

          ],
        ),
      ),
    );
  }
}



