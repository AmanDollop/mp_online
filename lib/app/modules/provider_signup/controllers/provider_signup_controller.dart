import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mp_online/app/data/apis/api_models/get_signup_model.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/alert_dialog_view.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/string_constants.dart';

class ProviderSignupController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cnfPasswordController = TextEditingController();

  FocusNode focusFullName = FocusNode();
  FocusNode focusShopName = FocusNode();
  FocusNode focusPhone = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusAddress = FocusNode();
  FocusNode focusPassword = FocusNode();
  FocusNode focusCnfPassword = FocusNode();

  final isFullName = false.obs;
  final isShopName = false.obs;
  final isPhone = false.obs;
  final isEmail = false.obs;
  final isAddress = false.obs;
  final isPassword = false.obs;
  final isCnfPassword = false.obs;
  final hide = true.obs;
  final checked = false.obs;
  final isLoading = false.obs;

  final count = 0.obs;
  final shopImage = Rxn<File>();
  final shopLicenceImage = Rxn<File>();
  final certificateImage = Rxn<File>();
  Map<String, File> imageMap = {};

  String dropdownvalue = StringConstants.provider;
  var items = [
    StringConstants.provider,
    StringConstants.tutor,
  ];

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
    focusFullName.addListener(onFocusChange);
    focusShopName.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusAddress.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
    focusCnfPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFullName.value = focusFullName.hasFocus;
    isShopName.value = focusShopName.hasFocus;
    isPhone.value = focusPhone.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isAddress.value = focusAddress.hasFocus;
    isPassword.value = focusPassword.hasFocus;
    isCnfPassword.value = focusCnfPassword.hasFocus;
  }

  void increment() => count.value++;

  void changeCheckBox() {
    checked.value = !checked.value;
  }

  void changeHideVisible() {
    hide.value = !hide.value;
  }

  clickOnLogIn() {
    Get.back();
  }

  void showAlertDialog(int index) {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MyAlertDialog(
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: cameraTextButtonView(),
              onPressed: () => clickCameraTextButtonView(index),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: galleryTextButtonView(),
              onPressed: () => clickGalleryTextButtonView(index),
            ),
          ],
          title: selectImageTextView(),
          content: contentTextView(),
        );
      },
    );
  }

  Widget selectImageTextView() => Text(
        StringConstants.selectImage,
        style: MyTextStyle.titleStyle18bb,
      );

  Widget contentTextView() => Text(
        StringConstants.chooseImageFromTheOptionsBelow,
        style: MyTextStyle.titleStyle14bb,
      );

  Widget cameraTextButtonView() => Text(
        StringConstants.camera,
        style: MyTextStyle.titleStyle10bb,
      );

  Widget galleryTextButtonView() => Text(
        StringConstants.gallery,
        style: MyTextStyle.titleStyle10bb,
      );

  Future<void> clickCameraTextButtonView(int index) async {
    pickCamera(index);
    Get.back();
  }

  Future<void> clickGalleryTextButtonView(int index) async {
    pickGallery(index);
    Get.back();
  }

  Future<void> pickCamera(int index) async {
    if (index == 0) {
      shopImage.value = await ImagePickerAndCropper.pickImage(
        context: Get.context!,
        wantCropper: true,
        color: Theme.of(Get.context!).primaryColor,
      );
    } else {
      shopLicenceImage.value = await ImagePickerAndCropper.pickImage(
        context: Get.context!,
        wantCropper: true,
        color: Theme.of(Get.context!).primaryColor,
      );
    }
    increment();
  }

  Future<void> pickGallery(int index) async {
    if (index == 0) {
      shopImage.value = await ImagePickerAndCropper.pickImage(
          context: Get.context!,
          wantCropper: true,
          color: Theme.of(Get.context!).primaryColor,
          pickImageFromGallery: true);
    } else {
      shopLicenceImage.value = await ImagePickerAndCropper.pickImage(
          context: Get.context!,
          wantCropper: true,
          color: Theme.of(Get.context!).primaryColor,
          pickImageFromGallery: true);
    }

    increment();
  }

  clickOnSubmitButton() async {
    isLoading.value = true;
    if (shopImage.value != null &&
        fullNameController.text.isNotEmpty &&
        shopNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        cnfPasswordController.text.isNotEmpty &&
        shopImage.value != null &&
        shopLicenceImage.value != null) {
      imageMap = {
        ApiKeyConstants.shopBanner: shopImage.value ?? File(''),
        ApiKeyConstants.drivingLicence: shopLicenceImage.value ?? File(''),
      };
      Map<String, String> bodyParams = {
        ApiKeyConstants.firstName: fullNameController.text.toString(),
        ApiKeyConstants.lastName: shopNameController.text.toString(),
        ApiKeyConstants.mobile: phoneController.text.toString(),
        ApiKeyConstants.shopAddress: addressController.text.toString(),
        ApiKeyConstants.email: emailController.text.toString(),
        ApiKeyConstants.password: cnfPasswordController.text.toString(),
        ApiKeyConstants.type: StringConstants.provider,
        ApiKeyConstants.userType: dropdownvalue,
      };
      SignUpModel? signUpModel =
          await ApiMethods.register(bodyParams: bodyParams, imageMap: imageMap);
      if (signUpModel != null && signUpModel.status == '1') {
        CommonWidgets.showToastMessage(signUpModel.message ?? '');
        Get.back();
      } else {
        CommonWidgets.showToastMessage(signUpModel!.message ?? '');
      }
    } else {
      CommonWidgets.showToastMessage('All Fields Required');
    }
    isLoading.value = false;
  }
}
