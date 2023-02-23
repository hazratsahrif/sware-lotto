import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/controllers/settings_controller.dart';
import 'package:wallet/constant/api_url.dart';
import 'package:wallet/constant/colors.dart';

class ShowDepositView extends GetView<SettingsController> {
   ShowDepositView({Key? key}) : super(key: key);
  final controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,),
        ),
        title: const Text('Deposit History',style: TextStyle(color: Colors.black),),
      ),
      body: controller.dashBoardController.depositList.length==0?
      Center(child: Text("No record found", style: TextStyle(color: Colors.black, fontSize: 20),))
          :ListView.builder(
        itemCount: controller.dashBoardController.depositList.length,
        itemBuilder: (BuildContext context, int index){
          return InkWell(
            onTap: (){},
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              padding: EdgeInsets.all(12),
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF1644FF),width: 1),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF1644FF).withOpacity(0),
                      Color(0xFF1644FF),
                    ]
                ),
                color: MyColor.background.withOpacity(0.9),
                borderRadius: BorderRadius.circular(8),

              ),
              child: Column(
                children: [
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  child: controller.profileController.trimImage.toString().isNotEmpty?ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image.network(ApiUrl.imageBaseUser+controller.profileController.trimImage,fit: BoxFit.cover,)):
                                  CircleAvatar(
                                    backgroundImage: AssetImage(""),
                                  )
                                  ,
                                  width: 44,
                                  height: 44,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: MyColor.background,width: 2),
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Text(controller.profileController.userName ?? "Name",style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),

                          ],
                          crossAxisAlignment: CrossAxisAlignment.center,

                        ),

                      ),
                      Flexible(child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(controller.date.formatedDate(controller.dashBoardController.depositList[index].createdAt!),style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                      ],)),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(text: controller.dashBoardController.depositList[index].amount!.toString(), style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: MyColor.yellow
                            )),
                            TextSpan(text: "  ₱", style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.black
                            )),
                          ]
                      )),
                      Flexible(
                        child:
                        Text(controller.dashBoardController.depositList[index].status==0?
                        "Pending":
                        "Approved",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: controller.dashBoardController.depositList[index].status==0? Colors.red:Colors.green

                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      )
    );
  }
}
