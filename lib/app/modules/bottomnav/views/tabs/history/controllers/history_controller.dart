import 'package:get/get.dart';
import 'package:wallet/app/modules/bottomnav/views/tabs/profile/controllers/profile_controller.dart';

class HistoryController extends GetxController {
  //TODO: Implement HistoryController
  final profileController = ProfileController.instance;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    profileController.getUserData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
