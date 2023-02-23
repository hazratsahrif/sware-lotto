import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:wallet/constant/api_url.dart';
import 'package:wallet/utils/SnackBarUtils.dart';
import 'package:wallet/app/modules/signup/controllers/signup_controller.dart';
import 'package:wallet/app/routes/app_pages.dart';
import 'package:wallet/constant/colors.dart';
import 'package:wallet/widgets/MyTextField.dart';

class PassworcodeView extends GetView {
   PassworcodeView({Key? key}) : super(key: key);
  TextEditingController codeController= TextEditingController();
   SignupController controller = Get.put(SignupController());
   bool isForgotPasswword = Get.arguments;
  @override
  Widget build(BuildContext context) {
    print(isForgotPasswword);

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
            MyTextField(hint: "Confirm code", controller: codeController, valueChanged: (val){},
              icons: null,
              isObsecure: false,

            ),
            Spacer(),
            Center(
              child:   MaterialButton(onPressed: (){
                if(isForgotPasswword){
                  if(codeController.text.isNotEmpty){
                    Map data=
                    {
                      "code":codeController.text
                    };
                    controller.postVerifyPassCode(data, ApiUrl.verificationEndPoint);
                    codeController.text='';

                  }
                  else{
                    SnackBarUtils.showError("Please fill the field!");
                  }
                }
                else{


                if(codeController.text.isNotEmpty){
                  Map data=
                  {
                    "code":codeController.text
                  };
                  controller.postVerifyUser(data);
                  codeController.text='';

                }
                else{
                  SnackBarUtils.showError("Please fill the field!");
                }
                }
              }, child: Icon(Icons.arrow_forward_rounded,size: 30, color: Colors.white,),
                color: MyColor.yellow,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),

              ),
            ),
            Spacer(),

          ],
        ),
      ),
    );
  }
}
