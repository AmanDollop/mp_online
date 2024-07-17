import 'dart:convert';

import 'package:get/get.dart';
import 'package:mp_online/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/local_data.dart';
import '../../../data/apis/api_models/get_user_model.dart';
import '../../../data/constants/string_constants.dart';
late LocalUserData myController;
class SplashController extends GetxController {
  //TODO: Implement SplashController

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

  onClickScreen() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString(StringConstants.userData)!=null){
      Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
      UserData userData = UserData.fromJson(jsonData);
      myController=Get.put(LocalUserData());
      myController.setUserData(userData);
      Get.toNamed(myController.loginTypeUser.value?Routes.NAV_BAR:Routes.PROVIDER_NAV_BAR);
    }else{
      Get.offNamed(Routes.LOGIN_TYPE);
    }
  }
}
