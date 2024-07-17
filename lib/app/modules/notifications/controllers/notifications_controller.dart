import 'package:get/get.dart';
import 'package:mp_online/app/data/constants/string_constants.dart';
import 'package:mp_online/app/routes/app_pages.dart';

class NotificationsController extends GetxController {
//TODO: Implement NotificationSettingController

  final count = 0.obs;
  List<bool> statusList=[true,true,false,false,true];
  List<Map<String,String>> notificationName=
  [
    {
      "title":"New Proposal received by amit",
      "message":StringConstants.test,
    },
    {
      "title":"Payment successfully",
      "message":StringConstants.test,
    },
    {
      "title":"New Proposal received by amit",
      "message":StringConstants.test,
    },
    {
      "title":"your proposal accepted",
      "message":StringConstants.test,
    }
  ];
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


  clickOnSettingIcon(){
    Get.toNamed(Routes.NOTIFICATION_SETTING);
  }
}
