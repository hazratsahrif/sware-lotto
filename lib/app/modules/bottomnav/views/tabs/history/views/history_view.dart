import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:wallet/constant/colors.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('History', style: TextStyle(color: Colors.black),),
            Icon(Icons.filter_list_alt, color: MyColor.yellow,size: 32,)
          ],
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset("assets/seetingbackground.png", fit: BoxFit.cover,),
          ListView.builder(
            itemCount: 7,
            itemBuilder: (BuildContext context, int index){
              return InkWell(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  padding: EdgeInsets.all(12),
                  width: MediaQuery.of(context).size.width,

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

                                  child: CircleAvatar(
                                    backgroundImage: AssetImage("assets/Profile.png",),
                                  ),
                                  width: 42,
                                  height: 42,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: MyColor.background,width: 2),
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Text("Gigi UY",style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                            SizedBox(height: 12,),
                            RichText(text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(text: "5000", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32,
                                      color: MyColor.yellow
                                  )),
                                  TextSpan(text: "  ₱", style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 32,
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
                          child: Text("Bet No: 920",style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text("25-01-2023",style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text("04:00 PM",style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),),
                        ),



                      ],)),
                    ],
                  ),
                ),
              );
            },


          )




        ],
      ),
    );
  }
}
