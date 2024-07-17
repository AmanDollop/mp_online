import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController cnfPasswordController=TextEditingController();


  FocusNode focusFirstName = FocusNode();
  FocusNode focusLastName = FocusNode();
  FocusNode focusPhone = FocusNode();
  FocusNode focusPassword = FocusNode();
  FocusNode focusCnfPassword = FocusNode();

  final isFirstName = false.obs;
  final isLastName = false.obs;
  final isPhone = false.obs;
  final isPassword = false.obs;
  final isCnfPassword = false.obs;
  final hide = true.obs;
  final checked = false.obs;

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
    focusPassword.addListener(onFocusChange);
    focusCnfPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFirstName.value = focusFirstName.hasFocus;
    isLastName.value = focusLastName.hasFocus;
    isPhone.value = focusPhone.hasFocus;
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
}
