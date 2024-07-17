import 'package:get/get.dart';
import 'package:mp_online/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutController extends GetxController {
  //TODO: Implement LogoutController

  final count = 0.obs;
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

  logout() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Get.offNamedUntil(Routes.SPLASH, (route) => false);
  }
}
