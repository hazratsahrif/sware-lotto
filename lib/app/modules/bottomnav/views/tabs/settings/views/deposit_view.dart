import 'dart:io';

import 'package:cross_file/src/types/interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/controllers/settings_controller.dart';
import 'package:wallet/constant/api_url.dart';
import 'package:wallet/utils/SnackBarUtils.dart';
import 'package:wallet/widgets/PrimaryButton.dart';
import 'package:wallet/widgets/ProfileTextField.dart';

class DepositView extends GetView<SettingsController> {
  DepositView({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController referenceController = TextEditingController();
  final controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    print("sadia");
    print(controller.depositImage!);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: const Text(
          'Deposit',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.06,
              ),
              IntrinsicHeight(
                child: Container(
                  padding:
                  EdgeInsets.only(top: 9, left: 16, right: 16, bottom: 25),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            blurRadius: 2,
                            blurStyle: BlurStyle.outer,
                            spreadRadius: 3),
                      ]),
                  child: Column(
                    children: [
                      ProfileTextField(
                        title: "Name",
                        suffixIcon: null,
                        controller: nameController,
                        textInputType: TextInputType.text,
                      ),
                      ProfileTextField(
                        title: "Amount of deposit",
                        suffixIcon: null,
                        controller: amountController,
                        textInputType: TextInputType.number,
                      ),
                      ProfileTextField(
                        title: "Reference on gcash",
                        suffixIcon: null,
                        controller: referenceController,
                        textInputType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() {
                return Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 2,
                              blurStyle: BlurStyle.outer,
                              spreadRadius: 3),
                        ]),
                    child: controller.depositImage!.value!.isEmpty ?
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Text("Attach screenshot", style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.w500

                        ),),
                        IconButton(onPressed: () async{
                          await controller.profileController.getFromGallery();
                          print(controller.profileController.img.value.path);
                          controller.depositImage!.value=controller.profileController.img.value.path;

                          print("hazrat"+controller.depositImage!.value!);
                        }, icon: Icon(Icons.add_a_photo, color: Colors.blue,)),
                      ],
                    ) :
                    Image.file(
                      File(controller.depositImage!.value),
                      fit: BoxFit.fill,
                    )
                );
              }),
              SizedBox(
                height: 20,
              ),
              Text("Send Gcash here: 09771656939",

                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),
              ),

              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 0.06,
              ),

              PrimaryButton(
                title: "Proceed",
                onTab: () async {
                  if (controller.profileController.img.value.name.isEmpty) {
                    SnackBarUtils.showError("Please attach screenshot!");
                  }

                  if (nameController.text.isNotEmpty ||
                      amountController.text.isNotEmpty ||
                      referenceController.text.isNotEmpty) {
                    Map data = {
                      "amount": amountController.text,
                      "reference": referenceController.text,
                      "screenshot": controller.depositImage!.value,
                    };
                    await controller.submitSubscription(data, ApiUrl.userDepositEndPoint);
                  } else {
                    SnackBarUtils.showError("Please fill all the field!");
                  }
                },
              ),


            ],
          ),
        ),
      ),
    );
  }
}
