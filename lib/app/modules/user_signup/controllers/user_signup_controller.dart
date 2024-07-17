import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mp_online/common/MyTextStyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/alert_dialog_view.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_signup_model.dart';
import '../../../data/constants/string_constants.dart';

class UserSignupController extends GetxController {
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController cnfPasswordController=TextEditingController();


  FocusNode focusFirstName = FocusNode();
  FocusNode focusLastName = FocusNode();
  FocusNode focusPhone = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();
  FocusNode focusCnfPassword = FocusNode();

  final isFirstName = false.obs;
  final isLastName = false.obs;
  final isPhone = false.obs;
  final isEmail = false.obs;
  final isPassword = false.obs;
  final isCnfPassword = false.obs;
  final hide = true.obs;
  final checked = false.obs;

  final isLoading = false.obs;
  Map<String, File> imageMap = {};
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    startListener();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void startListener() {
    focusFirstName.addListener(onFocusChange);
    focusLastName.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
    focusCnfPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFirstName.value = focusFirstName.hasFocus;
    isLastName.value = focusLastName.hasFocus;
    isPhone.value = focusPhone.hasFocus;
    isEmail.value = focusPhone.hasFocus;
    isPassword.value = focusPassword.hasFocus;
    isCnfPassword.value = focusCnfPassword.hasFocus;
  }

  void increment() => count.value++;
  void changeCheckBox(){
    checked.value=!checked.value;
  }
  void changeHideVisible(){
    hide.value=!hide.value;
  }

  clickOnLogIn(){
    Get.back();
  }


  clickOnSubmitButton() async {
    isLoading.value = true;
    if ( firstNameController.text.isNotEmpty  && lastNameController.text.isNotEmpty && emailController.text.isNotEmpty
        && phoneController.text.isNotEmpty && cnfPasswordController.text.isNotEmpty) {
      Map<String,String> bodyParams = {
        ApiKeyConstants.firstName:firstNameController.text.toString(),
        ApiKeyConstants.lastName:lastNameController.text.toString(),
        ApiKeyConstants.mobile:phoneController.text.toString(),
        ApiKeyConstants.email:emailController.text.toString(),
        ApiKeyConstants.password:cnfPasswordController.text.toString(),
        ApiKeyConstants.type: StringConstants.user,
        ApiKeyConstants.userType:StringConstants.user,
      };
      SignUpModel? signUpModel =
      await ApiMethods.userRegister(
          bodyParams: bodyParams);
      if (signUpModel != null && signUpModel.status=='1') {
        CommonWidgets.showToastMessage( signUpModel.message??'');
        Get.back();
      }else{
        CommonWidgets.showToastMessage( signUpModel!.message??'');
      }
    } else {
      CommonWidgets.showToastMessage('All Fields Required');
    }
    isLoading.value = false;
  }
}
