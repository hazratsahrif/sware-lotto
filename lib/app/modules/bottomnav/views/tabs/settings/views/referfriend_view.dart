import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/controllers/settings_controller.dart';
import 'package:wallet/constant/colors.dart';
import 'package:wallet/widgets/PrimaryButton.dart';

import 'package:share_plus/share_plus.dart';



class ReferfriendView extends GetView<SettingsController> {
   ReferfriendView({Key? key}) : super(key: key);
  final controller = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
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
          'Refer Friends',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/seetingbackground.png',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.profileController.userData!.value.referralCode!,
                          style: TextStyle(
                              color: MyColor.yellow,
                              fontWeight: FontWeight.bold,
                              fontSize: 32),
                        ),
                        OutlinedButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(
                                text: controller.profileController.userData
                                    !.value.referralCode!));
                          },

                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            side: MaterialStateProperty.all(BorderSide(width:2.3,color: MyColor.yellow))
                          ),
                          child: Text(
                            "Copy",
                            style: TextStyle(
                                color: MyColor.yellow, fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                PrimaryButton(title: "Invite", onTab: () {
                  print("click");
                  onShare(context,controller.profileController.userData!.value.referralCode!);


                }),
                Spacer(),
                Center(
                  child: Text(
                    "Earn by invite your friends",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  "Invite a friend and earn 100 ₱",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16),
                ),
                SizedBox(height: 8,),
                Text(
                  "When you invite a friend and he/she plays a bet and earn rewards, you will get 100 ₱",
                  style: TextStyle(
                      color: Colors.black,

                      fontSize: 16),
                ),
                SizedBox(height: 8,),
                Text(
                  "Invite multiple friends and get more rewards",
                  style: TextStyle(
                      color: Colors.black,

                      fontSize: 16),
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
   void onShare(BuildContext context,String text) async {
     final box = context.findRenderObject() as RenderBox?;

     // subject is optional but it will be used
     // only when sharing content over email
     await Share.share(text,
         subject: "",
         sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
   }


}
