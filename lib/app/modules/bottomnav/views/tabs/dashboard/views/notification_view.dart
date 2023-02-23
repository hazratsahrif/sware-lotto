import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/dashboard/controllers/dashboard_controller.dart';
import 'package:wallet/constant/api_url.dart';
import 'package:wallet/constant/colors.dart';

class NotificationView extends GetView<DashboardController> {
   NotificationView({Key? key}) : super(key: key);
  final controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.black,),
        ),
        title: const Text('Notifications',style: TextStyle(color: Colors.black),),
      ),
      body: controller.notificationResponse.value.notifications!.length==0?
      Center(child: Text("No record found", style: TextStyle(color: Colors.black, fontSize: 20),))
          :ListView.builder(
        itemCount: controller.notificationList.length,
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
                      Flexible(child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(controller.notificationList[index].title!,style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                        ),),
                      )),
                    ],
                  ),
                  SizedBox(height: 12,),
                  // Flex(
                  //   direction: Axis.horizontal,
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Flexible(
                  //       child: RichText(text: TextSpan(
                  //           children: <TextSpan>[
                  //             TextSpan(text: controller.notificationList[index]!.toString(), style: TextStyle(
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 30,
                  //                 color: MyColor.yellow
                  //             )),
                  //             TextSpan(text: "  ₱", style: TextStyle(
                  //                 fontWeight: FontWeight.bold,
                  //                 fontSize: 30,
                  //                 color: Colors.black
                  //             )),
                  //           ]
                  //       )),
                  //     ),
                  //     Flexible(
                  //       child:
                  //       Text( controller.notificationList[index]==0?
                  //       "Pending":
                  //       "Approved",
                  //           style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 16,
                  //               color: controller.notificationList[index]==0? Colors.red:Colors.green
                  //
                  //           )),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          );
        },
      )
    );
  }
}
