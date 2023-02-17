import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/dashboard/views/dashboard_view.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/history/views/history_view.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/profile/views/profile_view.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/settings/views/settings_view.dart';

import '../controllers/bottomnav_controller.dart';

class BottomnavView extends GetView<BottomnavController> {
  BottomnavView({Key? key}) : super(key: key);
  List<Widget> currentView = [
    DashboardView(),
    HistoryView(),
    SettingsView(),
    ProfileView()
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          bottomNavigationBar:

          SalomonBottomBar(
            unselectedItemColor: Colors.black45,
            currentIndex: controller.index.value,
            onTap: (i) => controller.index.value = i,
            items: [

              /// Home
              SalomonBottomBarItem(
                icon: Icon(Icons.dashboard),
                title: Text("Dasboard"),
                selectedColor: Colors.lightBlueAccent,
              ),

              /// Likes
              SalomonBottomBarItem(
                icon: Icon(Icons.history),
                title: Text("History"),
                selectedColor: Colors.lightBlueAccent,
              ),

              /// Search
              SalomonBottomBarItem(
                icon: Icon(Icons.settings),
                title: Text("Setting"),
                selectedColor: Colors.lightBlueAccent,
              ),

              /// Profile
              SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile"),
                selectedColor: Colors.lightBlueAccent,
              ),
            ],
          ),


          body: currentView[controller.index.value]
      );
    });
  }
}
