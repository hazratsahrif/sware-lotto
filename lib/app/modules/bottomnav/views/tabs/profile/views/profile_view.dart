import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wallet/constant/api_url.dart';
import 'package:wallet/constant/colors.dart';
import 'package:wallet/utils/DatePicker.dart';
import 'package:wallet/utils/SnackBarUtils.dart';
import 'package:wallet/utils/easy_loading.dart';
import 'package:wallet/widgets/ProfileTextField.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  TextEditingController nameController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    controller.img.value.path!="";
    nameController.text = controller.userData.value.nickName ?? "";
    birthController.text = controller.userData.value.dob ?? "";
    bioController.text = controller.userData.value.bio ?? '';
    controller.onInit();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Profile',
                style: TextStyle(color: Colors.black),
              ),
              MaterialButton(
                onPressed: () async {
                  final storage = new FlutterSecureStorage();
                  Loading().showEasyLoading("loading...");
                  await storage.delete(key: "token");
                  Loading().dismissEasyLoading();
                  Get.back();
                },
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                color: MyColor.yellow,
                padding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
            ],
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: InkWell(
                        onTap: (){
                          controller.getFromGallery();
                        },
                        child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),

                            ),
                            child: controller.img.value.path.isNotEmpty?
                            ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.file(File(controller.img.value.path),fit: BoxFit.cover,
                                )):controller.userData.value.image.toString().isNotEmpty?
                            ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network("https://swer3lotto.com/storage/app/public/"+controller.userData.value.image.toString().replaceAll(RegExp(r'\\'),""),fit: BoxFit.cover,
                                  )
                            ):
                            ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Icon(Icons.add_a_photo,
                                )
                            )
                          // :ClipRRect(
                            //     borderRadius: BorderRadius.circular(100),
                            //     child: Image.file(File(controller.userData.value.image),fit: BoxFit.cover,
                            //     )
                            // )

                        ),
                      ),
                    ),
                    controller.userData.value.nickName!.isEmpty
                        ? CircularProgressIndicator(color: MyColor.yellow)
                        : Text(
                      controller.userData.value.nickName!,
                      style: TextStyle(
                          color: MyColor.yellow,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 70,),
                    ProfileTextField(
                      title: controller.userData.value.nickName ?? "name",
                      suffixIcon: Icons.edit,
                      controller: nameController,
                      hintFontWeight: FontWeight.w800,
                      textFontWeight: FontWeight.w800,
                      textInputType: TextInputType.text,
                      onIconTab: () async {

                      },
                    ),
                    ProfileTextField(
                      title: controller.userData.value.dob ?? "null",
                      suffixIcon: Icons.calendar_month,
                      controller: birthController,
                      hintFontWeight: FontWeight.w800,
                      textFontWeight: FontWeight.w800,
                      textInputType: TextInputType.number,
                      onIconTab: () async {
                        birthController.text = (await PickNewDate().datePicker(context))!;

                      },
                    ),
                    SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.12,
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: bioController,
                                textInputAction: TextInputAction.done,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                ),
                                maxLines: 4,
                                decoration: InputDecoration(

                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(width: 0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0, color: Colors.white),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0, color: Colors.white),
                                    ),
                                    hintText: "Add your Bio",
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w800,
                                    )),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                ))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 70,),
                    MaterialButton(
                      onPressed: () async {

                        if(
                        nameController.text.isNotEmpty ||
                            birthController.text.isNotEmpty ||
                            bioController.text.isNotEmpty
                        ){
                        Map data ={

                        "bio": bioController.text,
                        "image":controller.img.value.path,
                        "dob":birthController.text,
                          "nick_name": nameController.text
                        };
                        print(data);
                        await controller.updateUserData(data,ApiUrl.updateUserEndPoint);

                        }
                        else{
                        SnackBarUtils.showError("Please fill all the field!");
                        }
                      },
                      child: Text(
                        "Update",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      color: MyColor.yellow,
                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ],
                ),
              );
            })));
  }
}


