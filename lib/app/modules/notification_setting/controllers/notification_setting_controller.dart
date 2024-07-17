import 'package:get/get.dart';
import 'package:mp_online/app/data/constants/string_constants.dart';

class NotificationSettingController extends GetxController {
  //TODO: Implement NotificationSettingController

  final count = 0.obs;
  List<bool> statusList=[true,true,false,false,true];
  List<String> notificationName=[StringConstants.generalNotification,StringConstants.sound,StringConstants.vibrate,StringConstants.appUpdates,StringConstants.newTipsAvailable];
  @override
  void onInit() {
    super.onInit();
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

  changeStatus(int index){
    statusList[index]=!statusList[index];
    increment();
  }
}
