import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mp_online/app/data/apis/api_models/get_send_otp_model.dart';
import 'package:mp_online/app/data/constants/string_constants.dart';
import 'package:mp_online/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class LoginController extends GetxController {
  TextEditingController phoneNumber=TextEditingController();
  Map<String,String?> parameter=Get.parameters;
  final count = 0.obs;
  final isLoading =false.obs;
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

  clickOnForgot(){
    Get.toNamed(Routes.OTP);
  }
  clickOnSignUp(){
    if(parameter[StringConstants.type]=='1'){
      Get.toNamed(Routes.USER_SIGNUP);
    }else{
      Get.toNamed(Routes.PROVIDER_SIGNUP);
    }
  }

  clickOnLogInButton2()async {
      if (phoneNumber.text.trim().isNotEmpty) {
        print('Phone Number:- +91${phoneNumber.text}');
        isLoading.value = true;
        try {
          await FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber: '+91${phoneNumber.text}',
            verificationCompleted: (PhoneAuthCredential credential) async {
              print("Auto-retrieval completed: $credential");
            },
            verificationFailed: (FirebaseAuthException authException) {
              print('Error: ${authException.message}');
              //CommonWidgets.showMyToastMessage('Error: ${authException.message}');
              isLoading.value = false;
            },
            codeSent: (String verificationId, int? forceResendingToken) {
              Map<String, String> parameters = {
                'otp': verificationId,
              };
              CommonWidgets.showToastMessage('Successfully send OTP your mobile number');
              isLoading.value = false;
              Get.offNamed(Routes.OTP, parameters: parameters);
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              print("Auto-retrieval timeout: $verificationId");
            },
          );
        } catch (e) {
          print('Error:- $e');
          // CommonWidgets.showMyToastMessage('Error: $e');
          isLoading.value = false;
        }
      } else {
        CommonWidgets.showToastMessage('Please enter phone number...');
      }
    }

  clickOnLogInButton() async {
    isLoading.value = true;
    if (phoneNumber.text.isNotEmpty) {
      String type=parameter[StringConstants.type]=='1'?StringConstants.user:StringConstants.provider;
      Map<String,String> bodyParams = {
        ApiKeyConstants.mobile:phoneNumber.text.toString(),
        ApiKeyConstants.type:type
      };
      SendOtpModel? sendOtpModel =
      await ApiMethods.sendOtpApi(
          bodyParams: bodyParams);
      if (sendOtpModel != null && sendOtpModel.status=='1') {
        try {
          await FirebaseAuth.instance.verifyPhoneNumber(
            phoneNumber: '+91${phoneNumber.text}',
            verificationCompleted: (PhoneAuthCredential credential) async {
              print("Auto-retrieval completed: $credential");
            },
            verificationFailed: (FirebaseAuthException authException) {
              print('Error: ${authException.message}');
              //CommonWidgets.showMyToastMessage('Error: ${authException.message}');
              isLoading.value = false;
            },
            codeSent: (String verificationId, int? forceResendingToken) {
              CommonWidgets.showToastMessage(sendOtpModel.message??'');
              Map<String,String> data={
                ApiKeyConstants.type:type,
                ApiKeyConstants.userId:sendOtpModel.userId??'',
                'otp': verificationId,
              };
              Get.toNamed(Routes.OTP,parameters: data);
            },
            codeAutoRetrievalTimeout: (String verificationId) {
              print("Auto-retrieval timeout: $verificationId");
            },
          );
        } catch (e) {
          print('Error:- $e');
          // CommonWidgets.showMyToastMessage('Error: $e');
          isLoading.value = false;
        }
      }else{
        CommonWidgets.showToastMessage(sendOtpModel!.message??'');
      }
    } else {
      CommonWidgets.showToastMessage('Please enter phone nu.');
    }
    isLoading.value = false;
  }
}
