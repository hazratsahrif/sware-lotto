import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/controllers/settings_controller.dart';
import 'package:wallet/constant/api_url.dart';
import 'package:wallet/constant/colors.dart';
import 'package:wallet/utils/SnackBarUtils.dart';
import 'package:wallet/widgets/PrimaryButton.dart';
import 'package:wallet/widgets/ProfileTextField.dart';

class WithdrawlView extends GetView<SettingsController> {
   WithdrawlView({Key? key}) : super(key: key);
  TextEditingController withdrawController = TextEditingController();
  TextEditingController accountController = TextEditingController();
   final controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        title: const Text('Withdraw', style: TextStyle(color: Colors.black),),
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
                            title: "Withdraw Amount",
                            suffixIcon: null,
                            controller: withdrawController,
                          textInputType: TextInputType.number,
                        ),
                        ProfileTextField(
                            title: "Account number",
                            suffixIcon: null,
                            controller: accountController,
                          textInputType: TextInputType.number,
                        ),


                      ],
                    ),

                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.08,),

              PrimaryButton(title: "Proceed", onTab: () async{

                if (withdrawController.text.isNotEmpty ||
                    accountController.text.isNotEmpty ) {
                  Map data = {
                    "amount": withdrawController.text,
                    "account_number": accountController.text,

                  };
                  await controller.withDrawApiResponse(data, ApiUrl.userwalletEndPoint);
                } else {
                  SnackBarUtils.showError("Please fill all the field!");
                }
              }),


              ],
            ),
          ),

        ],
      ),
    );
  }
}
