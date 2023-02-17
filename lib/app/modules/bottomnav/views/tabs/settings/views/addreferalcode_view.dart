import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/controllers/settings_controller.dart';
import 'package:wallet/constant/api_url.dart';
import 'package:wallet/widgets/PrimaryButton.dart';
import 'package:wallet/widgets/ProfileTextField.dart';

class AddreferalcodeView extends GetView<SettingsController> {
   AddreferalcodeView({Key? key}) : super(key: key);
  TextEditingController referelaController = TextEditingController();
  final controller = Get.put(SettingsController());
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
        title: const Text('Add Referal Code', style: TextStyle(color: Colors.black),),
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
                          title: "Add Referal Code",
                          suffixIcon: null,
                          controller: referelaController,
                          textInputType: TextInputType.number,

                        ),


                      ],
                    ),

                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08,),

                PrimaryButton(title: "Add",onTab: (){
                  Map data = {
                    "referral_code":controller.profileController.userData.value.referralCode!
                  };
                  controller.addReferalApiResponse(data, ApiUrl.addReferalEndPoint);


                },),


              ],
            ),
          ),

        ],
      ),
    );
  }
}
