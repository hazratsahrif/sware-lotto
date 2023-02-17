import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/profile/controllers/profile_controller.dart';
import 'package:wallet/constant/api_url.dart';
import 'package:wallet/constant/colors.dart';
import 'package:wallet/utils/SnackBarUtils.dart';
import 'package:wallet/widgets/MyTextFieldBlue.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {

  int endTime = DateTime
      .now()
      .millisecondsSinceEpoch + 715000 * 30;
  final format = DateFormat('dd MMM yyyy');
  TextEditingController amountController = TextEditingController();
  TextEditingController betController = TextEditingController();
  final controller = Get.put(DashboardController());



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyColor.bottomBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'SWER3 LOTTO',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  letterSpacing: -0.7),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_on_rounded,
                  color: MyColor.yellow,
                  size: 30,
                ))
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,


                padding: EdgeInsets.symmetric(vertical: 9, horizontal: 8),

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xff84CAEE),
                        Color(0xff486EFD),
                      ]),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Flex(

                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [

                              Text("Current Balance",
                                  style: GoogleFonts.courgette(
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white
                                      )
                                  )
                              ),
                              SizedBox(height: 16,),
                              Text("50.0 ₱",
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  )
                              ),
                              SizedBox(height: 16,),
                              Row(
                                children: [
                                  Container(child: Text("Withdraw",
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 11,
                                        letterSpacing: 0.3,

                                        fontWeight: FontWeight.w700),),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: MyColor.yellow,
                                        borderRadius: BorderRadius.circular(7)),),
                                  SizedBox(width: 8,),
                                  Container(child: Text("Deposit",
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 11,
                                        letterSpacing: 0.3,
                                        fontWeight: FontWeight.w700),),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: MyColor.yellow,
                                        borderRadius: BorderRadius.circular(7)
                                    ),
                                  ),
                                ],
                              )


                            ],
                          ),
                        )),
                    Flexible(
                        flex: 1,
                        child: Column(
                          children: [
                            Container(
                              width:130,
                              height: 130,


                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Color(0xff378AF2),
                                  border: Border.all(
                                      color: Color(0xff84CAEE), width: 2)

                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Remaining\ntime",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),),
                                    SizedBox(height: 12,),
                                    CountdownTimer(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500

                                      ),
                                      endWidget: Text(
                                          "Time out", style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16

                                      )),
                                      endTime: endTime,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text("Current date", textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,

                              ),),
                            Text(format.format(DateTime.now()),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white, fontSize: 10,
                                fontWeight: FontWeight.w500,

                              ),),
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(height: 20),

              Flex(
                direction: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Flexible(child: Stack(
                    children: [

                      Column(
                        children: [
                          SizedBox(height: 22,),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: Colors.white,
                              image: DecorationImage(image: AssetImage("assets/Background.png"),
                               fit: BoxFit.fitWidth,
                                alignment: Alignment.topCenter
                              )
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  SizedBox(height: 45,),
                                  Text("Result", style: TextStyle(
                                      color: MyColor.background.withOpacity(
                                          0.7),
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(height: 26,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flex(
                                        direction: Axis.horizontal,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 1,

                                            child: Text("02 PM", style: TextStyle(
                                                color: MyColor.yellow,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),

                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                bottom: 3, // space between underline and text
                                              ),
                                              decoration: BoxDecoration(
                                                  border: Border(bottom: BorderSide(
                                                    color: Colors.black,  // Text colour here
                                                    width: 2.0, // Underline width
                                                  ))
                                              ),

                                              child: Text(
                                                "911",

                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold
                                                ),
                                                    // Text colour here
                                              ),
                                            )
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2,),
                                      Text("Cut of time is 1.45 PM", style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 22,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flex(
                                        direction: Axis.horizontal,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 1,
                                            child: Text("05 PM", style: TextStyle(
                                                color: MyColor.yellow,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),

                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                bottom: 3, // space between underline and text
                                              ),
                                              decoration: BoxDecoration(
                                                  border: Border(bottom: BorderSide(
                                                    color: Colors.black,  // Text colour here
                                                    width: 2.0, // Underline width
                                                  ))
                                              ),

                                              child: Text(
                                                "911",

                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold
                                                ),
                                                // Text colour here
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2,),
                                      Text("Cut of time is 4.45 PM", style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 22,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Flex(
                                        direction: Axis.horizontal,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Flexible(
                                            flex: 1,

                                            child: Text("09 PM", style: TextStyle(
                                                color: MyColor.yellow,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold
                                            ),

                                            ),
                                          ),
                                          Flexible(
                                            flex: 1,
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                bottom: 3, // space between underline and text
                                              ),
                                              decoration: BoxDecoration(
                                                  border: Border(bottom: BorderSide(
                                                    color: Colors.black,  // Text colour here
                                                    width: 2.0, // Underline width
                                                  ))
                                              ),

                                              child: Text(
                                                "----",

                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold
                                                ),
                                                // Text colour here
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2,),
                                      Text("Cut of time is 8.45 PM", style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                      ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 22,),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                      Align(

                        child: Image.asset('assets/clock.png', width: 60,),
                        alignment: Alignment.center,
                      ),
                    ],
                  )),
                  SizedBox(width: 12,),
                  Flexible(child: Stack(
                    children: [

                      Column(
                        children: [
                          SizedBox(height: 22,),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,


                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              color: Colors.white,
                                image: DecorationImage(image: AssetImage("assets/Background.png"),
                                    fit: BoxFit.fitWidth,
                                    alignment: Alignment.topCenter
                                )
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 40,),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                          color: Colors.lightBlueAccent),

                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.access_time_outlined,
                                          color: Colors.grey,size: 16,),
                                        SizedBox(width: 8,),
                                        Expanded(
                                          child: Obx(() {
                                            return DropdownButton<String>(


                                              hint: Text("Pick a Time", style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13
                                              ),),
                                              isDense:true,
                                              isExpanded: true,
                                              underline: Text(""),

                                              value: controller.selectedItem!.value.isNotEmpty?controller.selectedItem!.value:null,
                                              onChanged: (value) {

                                                controller.selectedItem!.value = value!;

                                              },
                                              items: <String>['02 PM', '05 PM', '09 PM']
                                                  .map<DropdownMenuItem<String>>((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              })
                                                  .toList(),
                                            );
                                          }),
                                        ),

                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 12,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: MyTextFieldBlue(hint: "Enter amount",
                                            controller: amountController,
                                            valueChanged: (val){},
                                            icons: null,
                                            isObsecure: false),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                        child: Text("₱", style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w700
                                        ),),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 8,),
                                  MyTextFieldBlue(hint: "Bet number",
                                      controller: betController,
                                      valueChanged: (val){},
                                      icons: null,
                                      isObsecure: false),

                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: TextButton(onPressed: (){},
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all(EdgeInsets.zero),

                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [

                                      Text("Info",style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500
                                      ),),
                                      Icon(Icons.info_outline, color: Colors.black,),


                                    ],)),
                                  ),
                                  MaterialButton(onPressed: (){
                                    if(
                                          amountController.text.isNotEmpty ||
                                           betController.text.isNotEmpty ||
                                        controller.selectedItem!.value.isNotEmpty

                                    ){
                                      Map data ={
                                        "date":controller.selectedItem!.value,
                                        "price":amountController.text,
                                        "betting_number":betController.text
                                      };
                                      controller.bettingApiResponse(data,ApiUrl.bttingEndPoint);

                                    }
                                    else{
                                      SnackBarUtils.showError("Please fill all the field!");
                                    }


                                    Get.dialog(
                                       Dialog(
                                         child: Container(
                                           height: MediaQuery.of(context).size.height*0.2,
                                           padding: EdgeInsets.all(16),
                                           child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             mainAxisAlignment: MainAxisAlignment.start,
                                             children: [
                                               Center(
                                                 child: Text("Note",
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold
                                                  ),
                                                 ),
                                               ),
                                               SizedBox(height: 16,),
                                               Text("1. Bet 10.00 win 5000.00",
                                                 style: TextStyle(
                                                     color: Colors.black,
                                                     fontSize: 18,
                                                     fontWeight: FontWeight.bold
                                                 ),
                                               ),
                                               Text("2. Minimum bet: 10.00",
                                                 style: TextStyle(
                                                     color: Colors.black,
                                                     fontSize: 18,
                                                     fontWeight: FontWeight.bold
                                                 ),
                                               ),
                                               Text("3. Maximum bet: 100.00",
                                                 style: TextStyle(
                                                     color: Colors.black,
                                                     fontSize: 18,
                                                     fontWeight: FontWeight.bold
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                       )


                                    );


                                  }, child: Text("Confirm",style: TextStyle(color: Colors.white,fontSize: 14),),
                                    color: MyColor.yellow,
                                    padding: EdgeInsets.symmetric(vertical: 6,horizontal: 4),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),


                                  ),
                                  SizedBox(height: 16,),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                      Align(

                        child: Image.asset('assets/casino.png', width: 60,),
                        alignment: Alignment.center,
                      ),
                    ],
                  )),


                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Today's Bet",
                    style: TextStyle(
                        color: MyColor.background.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  ),
                ),
              ),
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index){
                    return   Card(
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(horizontal: 4,vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Table(
                          children: [
                            TableRow(
                                children: [
                                  Center(child: TableText2(heading: "Bet no",color:   MyColor.yellow,fontWeight: FontWeight.bold,fontSize: 18,)),
                                  Center(child: TableText2(heading: "Amount",color: MyColor.yellow,fontWeight: FontWeight.bold,fontSize: 18,)),
                                  Center(child: TableText2(heading: "Draw Time",color: MyColor.yellow,fontWeight: FontWeight.bold,fontSize: 18,)),

                                ]
                            ),
                            TableRow(
                                children: [
                                  Center(child: TableText2(heading: "916",color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14,)),
                                  Center(child: TableText2(heading: "100",color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14,)),
                                  Center(child: TableText2(heading: "11 AM",color: Colors.black,fontWeight: FontWeight.w600,fontSize: 14,)),

                                ]
                            )
                          ],
                        ),
                      ),
                    );

                  }),



            ],
          ),
        ),
      ),
    );
  }
}
class TableText2 extends StatelessWidget {
  String heading;
  Color color;
  FontWeight fontWeight;
  double? fontSize;

  TableText2({required this.heading,required this.color,required this.fontWeight, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(heading,

        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize ?? 14,
          color: color,

        ),
      ),
    );
  }
}
