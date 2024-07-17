import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mp_online/app/data/apis/api_models/get_user_model.dart';
import 'package:mp_online/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/local_data.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/string_constants.dart';

class OtpController extends GetxController {
  final TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();
  final TextEditingController fieldFive = TextEditingController();
  final TextEditingController fieldSix = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  final count = 0.obs;
  final otpValue = ''.obs;
  final isLoading =false.obs;

  Map<String,String?> parameters=Get.parameters;

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

  clickOnCheckOtpButton() async {
    isLoading.value = true;
    if ( fieldOne.text.isNotEmpty && fieldThree.text.isNotEmpty && fieldThree.text.isNotEmpty && fieldFour.text.isNotEmpty&& fieldFive.text.isNotEmpty&& fieldSix.text.isNotEmpty) {
      Map<String,String> bodyParams = {
        ApiKeyConstants.userId:parameters[ApiKeyConstants.userId]??'',
        ApiKeyConstants.otp:'${fieldOne.text}${fieldTwo.text}${fieldThree.text}${fieldFour.text}${fieldFive.text}${fieldSix.text}'
      };
      UserModel? userModel =
      await ApiMethods.checkOtpApi(
          bodyParams: bodyParams);
      if (userModel != null && userModel.status=='1') {
        saveDataSharedPreference(userModel.userData!);
      }
    } else {
      CommonWidgets.showToastMessage('Please enter 4 digits otp.');
    }
    isLoading.value = false;
  }

  Future<void> firebaseOtpWithVerification() async {
    isLoading.value = true;
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: parameters['otp'] ?? '',
        smsCode: pinController.text,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      Map<String,String> bodyParams = {
        ApiKeyConstants.userId:parameters[ApiKeyConstants.userId]??'',
        ApiKeyConstants.otp:'9999'
      };
      UserModel? userModel =
      await ApiMethods.checkOtpApi(
          bodyParams: bodyParams);
      if (userModel != null && userModel.status=='1') {
        saveDataSharedPreference(userModel.userData!);
      }
      isLoading.value = false;
    } catch (e) {
      print('Error: $e');
      isLoading.value = false;
    }
  }


  saveDataSharedPreference(UserData userdata) async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    CommonWidgets.showToastMessage("Successfully Login Complete");
    String userDataString = jsonEncode(userdata);
    sharedPreferences.setString(StringConstants.userData, userDataString);
    sharedPreferences.setString(ApiKeyConstants.userType, userdata.type??'');
    LocalUserData myController=Get.put(LocalUserData());
    await myController.setUserData(userdata);
    isLoading.value = false;
    Get.toNamed(myController.loginTypeUser.value?Routes.NAV_BAR:Routes.PROVIDER_NAV_BAR);
  }
}
