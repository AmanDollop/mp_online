
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mp_online/app/data/apis/api_models/get_user_model.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class ChangePasswordController extends GetxController {
  TextEditingController currentPasswordController=TextEditingController();
  TextEditingController newPasswordController=TextEditingController();
  TextEditingController cnfPasswordController=TextEditingController();


  FocusNode focusCurrentPassword = FocusNode();
  FocusNode focusNewPassword = FocusNode();
  FocusNode focusCnfPassword = FocusNode();

  final isCurrentPassword = false.obs;
  final isNewPassword = false.obs;
  final isCnfPassword = false.obs;
  final hide = true.obs;
  final count = 0.obs;

  final isLoading = false.obs;

  Map<String,String?> parameters=Get.parameters;
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
    focusCurrentPassword.addListener(onFocusChange);
    focusNewPassword.addListener(onFocusChange);
    focusCnfPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isCurrentPassword.value = focusCurrentPassword.hasFocus;
    isNewPassword.value = focusNewPassword.hasFocus;
    isCnfPassword.value = focusCnfPassword.hasFocus;
  }
  void changeHideVisible(){
    hide.value=!hide.value;
  }

  void increment() => count.value++;

  clickOnSubmitButton() async {
    isLoading.value = true;
    if ( currentPasswordController.text.isNotEmpty  && newPasswordController.text.isNotEmpty && cnfPasswordController.text.isNotEmpty) {
      Map<String,String> bodyParams = {
        ApiKeyConstants.password:cnfPasswordController.text.toString(),
        ApiKeyConstants.oldPassword:currentPasswordController.text.toString(),
        ApiKeyConstants.userId:parameters[ApiKeyConstants.userId]??'',
      };
      UserModel? userModel =
      await ApiMethods.changePasswordApi(
          bodyParams: bodyParams);
      if (userModel != null && userModel.status=='1') {
        CommonWidgets.showToastMessage(userModel.message??'');
      }
    } else {
      CommonWidgets.showToastMessage('All Fields Required');
    }
    isLoading.value = false;
  }
}
