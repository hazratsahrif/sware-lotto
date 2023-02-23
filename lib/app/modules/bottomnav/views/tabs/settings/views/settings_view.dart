import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/views/addreferalcode_view.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/views/changepassword_view.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/views/deposit_view.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/views/referfriend_view.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/views/show_deposit_view.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/views/with_darw_history_view.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/views/withdrawl_view.dart';
import 'package:wallet/app/routes/app_pages.dart';
import 'package:wallet/constant/colors.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
   SettingsView({Key? key}) : super(key: key);
  List<String> itemList = [
    "Deposit",
    "Withdraw",
    "Refer Friends",
    "Add Referel Code",
    "Change Password",
    "Privacy Policy",
    "About Us"
  ];
  List<Callback> callback =[
    ()=>Get.to(ShowDepositView()),
    ()=>Get.to(WithDarwHistoryView()),
    ()=>Get.to(ReferfriendView()),
    ()=>Get.to(AddreferalcodeView()),
    ()=>Get.to(ChangepasswordView()),
    () {

    },
    (){},

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: const Text('SettingsView', style: TextStyle(color: Colors.black),),
        centerTitle: false,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Image.asset("assets/seetingbackground.png", fit: BoxFit.cover,),
          ListView.builder(
            itemCount: itemList.length,
            itemBuilder: (BuildContext context, int index){
              return SettingCardWidgets(title: itemList[index],onTab:  callback[index]);
            },


          )

          // Column(
          //   children: [
          //     SettingCardWidgets(title: "Deposit",onTab: (){
          //
          //     },),
          //   ],
          // ),

        ],
      ),
    );
  }
}

class SettingCardWidgets extends StatelessWidget {
 String title;
 Callback onTab;


 SettingCardWidgets({required this.title, required this.onTab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTab,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        padding: EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width,


        decoration: BoxDecoration(
          color: MyColor.background,
          borderRadius: BorderRadius.circular(8),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w600
            ),),
            Icon(Icons.arrow_forward_ios_rounded, color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
