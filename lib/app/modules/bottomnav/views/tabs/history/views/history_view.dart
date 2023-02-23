import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/dashboard/controllers/dashboard_controller.dart';
import 'package:wallet/constant/api_url.dart';
import 'package:wallet/constant/colors.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<DashboardController> {
  HistoryView({Key? key}) : super(key: key);
  final controller = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('History', style: TextStyle(color: Colors.black),),
            Icon(Icons.filter_list_alt, color: MyColor.yellow, size: 32,)
          ],
        ),
        centerTitle: true,
      ),
      body: controller.bettingList.length == 0 ?
      Center(child: Text("No record found",
        style: TextStyle(color: Colors.black, fontSize: 20),))
          : ListView.builder(
        itemCount: controller.bettingList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Obx(() {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: EdgeInsets.all(12),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,

                decoration: BoxDecoration(
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
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(

                      child: Column(

                        children: [
                          Row(
                            children: [
                              Container(
                                child: controller.profileController.trimImage
                                    .toString()
                                    .isNotEmpty ? ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(ApiUrl.imageBaseUser +
                                        controller.profileController.trimImage,
                                      fit: BoxFit.cover,)) :
                                CircleAvatar(
                                  backgroundImage: AssetImage(""),
                                )
                                ,
                                width: 44,
                                height: 44,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: MyColor.background, width: 2),
                                    borderRadius: BorderRadius.circular(100)
                                ),
                              ),
                              SizedBox(width: 12,),
                              Text(
                                controller.profileController.userName ?? "name",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),)
                            ],
                          ),
                          SizedBox(height: 12,),
                          RichText(text: TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: controller.bettingList[index].price
                                        .toString() ?? "0", style: TextStyle(
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
                          ))


                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,

                      ),

                    ),
                    Flexible(child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          "Bet No: ${controller.bettingList.value[index]
                              .bettingNumber}", style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(controller.date.formatedDate(
                            controller.bettingList[index].createdAt!),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          "0"+controller.bettingList[index].date!+" PM", style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),),
                      ),


                    ],)),
                  ],
                ),
              );
            }),
          );
        },


      ),
    );
  }
}
