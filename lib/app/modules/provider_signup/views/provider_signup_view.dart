import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mp_online/app/data/constants/icons_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_signup_controller.dart';

class ProviderSignupView extends GetView<ProviderSignupController> {
  const ProviderSignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBarView(title: ''),
        resizeToAvoidBottomInset: false,
        body: Obx(() {
          controller.count.value;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20.px),
                  child: Column(
                    children: [
                      Text(
                        StringConstants.signUp,
                        style: MyTextStyle.customStyle(
                            fontWeight: FontWeight.bold, fontSize: 32.px),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5.px,
                      ),
                      Text(
                        StringConstants.startYourJourney,
                        style: MyTextStyle.titleStyle14b,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10.px,
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Select Provider"),
                                Obx(
                                  () {
                                    controller.count.value;
                                    return Container(
                                      height: 40,
                                      padding: EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        border: Border.all(
                                            color: Colors.grey,
                                            style: BorderStyle.solid,
                                            width: 0.80),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          hint: Text(
                                            'Select Item',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          items: controller.items
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          value: controller.dropdownvalue,
                                          onChanged: (String? newValue) {
                                            controller.dropdownvalue =
                                                newValue!;
                                            controller.increment();
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.px,
                      ),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusFullName,
                        title: StringConstants.fullName,
                        controller: controller.fullNameController,
                        hintText: StringConstants.enterYourFullName,
                        keyboardType: TextInputType.name,
                        isCard: controller.isFullName.value,
                      ),
                      SizedBox(
                        height: 10.px,
                      ),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusShopName,
                        title: StringConstants.shopName,
                        controller: controller.shopNameController,
                        hintText: StringConstants.enterYourShopName,
                        keyboardType: TextInputType.name,
                        isCard: controller.isShopName.value,
                      ),
                      SizedBox(
                        height: 10.px,
                      ),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                          focusNode: controller.focusPhone,
                          title: StringConstants.phoneNo,
                          controller: controller.phoneController,
                          hintText: StringConstants.enterYourMobileNumber,
                          keyboardType: TextInputType.phone,
                          isCard: controller.isPhone.value,
                          prefixIcon: Text(
                            '+ 91',
                            style: MyTextStyle.titleStyle16bb,
                          )),
                      SizedBox(
                        height: 10.px,
                      ),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusEmail,
                        title: StringConstants.email,
                        controller: controller.emailController,
                        hintText: StringConstants.enterYourEmailId,
                        keyboardType: TextInputType.emailAddress,
                        isCard: controller.isEmail.value,
                      ),
                      SizedBox(
                        height: 10.px,
                      ),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusAddress,
                        title: StringConstants.shopAddress,
                        controller: controller.addressController,
                        hintText: StringConstants.enterShopAddress,
                        keyboardType: TextInputType.name,
                        isCard: controller.isAddress.value,
                      ),
                      SizedBox(
                        height: 10.px,
                      ),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                          focusNode: controller.focusPassword,
                          obscureText: true,
                          title: StringConstants.password,
                          controller: controller.passwordController,
                          hintText: StringConstants.enterYourYourPassword,
                          keyboardType: TextInputType.visiblePassword,
                          isCard: controller.isPassword.value,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.changeHideVisible();
                            },
                            child: Icon(
                              controller.hide.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: primaryColor,
                              size: 20.px,
                            ),
                          )),
                      SizedBox(
                        height: 10.px,
                      ),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                          obscureText: true,
                          focusNode: controller.focusCnfPassword,
                          title: StringConstants.confirmPassword,
                          controller: controller.cnfPasswordController,
                          hintText: StringConstants.enterYourConformPassword,
                          keyboardType: TextInputType.visiblePassword,
                          isCard: controller.isCnfPassword.value,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              controller.changeHideVisible();
                            },
                            child: Icon(
                              controller.hide.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: primaryColor,
                              size: 20.px,
                            ),
                          )),
                      SizedBox(
                        height: 20.px,
                      ),
                      Text(
                        StringConstants.shopBanner,
                        style: MyTextStyle.titleStyle14b,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.showAlertDialog(0);
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 140.px,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.px, color: Colors.black54),
                                borderRadius: BorderRadius.circular(8.px),
                              ),
                              child:
                                  Obx(() => controller.shopImage.value == null
                                      ? const SizedBox()
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.px),
                                          child: Image.file(
                                            height: 140.px,
                                            fit: BoxFit.fill,
                                            File(
                                              controller.shopImage.value!.path
                                                  .toString(),
                                            ),
                                          ),
                                        )),
                            ),
                            CommonWidgets.appImagesView(
                                imagePath: IconConstants.icGallery,
                                width: 35.px,
                                height: 35.px,
                                fit: BoxFit.fill),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.px,
                      ),
                      Text(
                        StringConstants.shopLicensee,
                        style: MyTextStyle.titleStyle14b,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.showAlertDialog(1);
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 140.px,
                              width: double.infinity,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.px, color: Colors.black54),
                                borderRadius: BorderRadius.circular(8.px),
                              ),
                              child: Obx(() =>
                                  controller.shopLicenceImage.value == null
                                      ? const SizedBox()
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.px),
                                          child: Image.file(
                                            height: 140.px,
                                            fit: BoxFit.fill,
                                            File(
                                              controller
                                                  .shopLicenceImage.value!.path
                                                  .toString(),
                                            ),
                                          ),
                                        )),
                            ),
                            CommonWidgets.appImagesView(
                                imagePath: IconConstants.icGallery,
                                width: 35.px,
                                height: 35.px,
                                fit: BoxFit.fill),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.px,
                      ),
                      RichText(
                          text: TextSpan(
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                              //apply style to all
                              children: [
                            TextSpan(
                                text: StringConstants
                                    .bySigningUpYouAreAcknowledgingThatYouHaveRead,
                                style: MyTextStyle.titleStyle14b),
                            const TextSpan(
                                text: StringConstants.termsOfService,
                                style: TextStyle(
                                    fontSize: 16, color: primary2Color)),
                            TextSpan(
                                text: StringConstants.and,
                                style: MyTextStyle.titleStyle14b),
                            const TextSpan(
                                text: StringConstants.privacyPolicy,
                                style: TextStyle(
                                    fontSize: 16, color: primary2Color)),
                          ])),
                      SizedBox(
                        height: 20.px,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 25.px,
                            width: 25.px,
                            margin: EdgeInsets.all(5.px),
                            child: Checkbox(
                              value: controller.checked.value,
                              onChanged: (bool? value) {
                                controller.changeCheckBox();
                              },
                            ),
                          ),
                          Expanded(
                              child: Text(
                            StringConstants.iAgreeWithTheTermsAndConditions,
                            style: MyTextStyle.titleStyle12b,
                            textAlign: TextAlign.justify,
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 50.px,
                      ),
                      CommonWidgets.commonElevatedButton(
                          onPressed: () {
                            controller.clickOnSubmitButton();
                          },
                          child: Text(
                            StringConstants.signUp,
                            style: MyTextStyle.titleStyle20bw,
                          ),
                          borderRadius: 10.px,
                          isLoading: controller.isLoading.value),
                      SizedBox(
                        height: 20.px,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.clickOnLogIn();
                        },
                        child: RichText(
                            text: TextSpan(
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                                //apply style to all
                                children: [
                              TextSpan(
                                  text: StringConstants.iHaveAlreadyAccount,
                                  style: MyTextStyle.titleStyle14bb),
                              const TextSpan(
                                text: StringConstants.login,
                                style: TextStyle(
                                    fontSize: 16, color: primary2Color),
                              ),
                            ])),
                      ),
                      SizedBox(
                        height: 30.px,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }));
  }
}
