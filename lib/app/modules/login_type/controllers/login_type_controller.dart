import 'package:get/get.dart';
import 'package:mp_online/app/data/constants/string_constants.dart';
import 'package:mp_online/app/routes/app_pages.dart';

class LoginTypeController extends GetxController {
  //TODO: Implement LoginTypeController
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

  clickOnUserButton(){
    Map<String,String> data={
      StringConstants.type:'1'
    };
    Get.toNamed(Routes.LOGIN,parameters: data);
  }

  clickOnProviderButton(){
    Map<String,String> data={
      StringConstants.type:'2'
    };
    Get.toNamed(Routes.LOGIN,parameters: data);
  }
}
