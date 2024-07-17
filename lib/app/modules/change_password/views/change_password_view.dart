import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBarView(title:StringConstants.changePassword),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(10.px),
          child: CommonWidgets.commonElevatedButton(
              onPressed: (){
                controller.clickOnSubmitButton();
              },
              child:Text(StringConstants.submit,style: MyTextStyle.titleStyle20bw,),
              borderRadius: 10.px,
             buttonColor: primaryColor,
            isLoading: controller.isLoading.value
          ),
        ),
        body:Obx((){
          controller.count.value;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20.px),
                  child: Column(
                    children: [
                      SizedBox(height: 10.px,),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                          focusNode: controller.focusCurrentPassword,
                          obscureText: true,
                          title: StringConstants.password,
                          controller: controller.currentPasswordController,
                          hintText: StringConstants.currentPassword,
                          keyboardType: TextInputType.visiblePassword,
                          isCard: controller.isCurrentPassword.value,
                          suffixIcon: GestureDetector(
                            onTap: (){
                              controller.changeHideVisible();
                            },
                            child:
                            Icon( controller.hide.value?Icons.visibility_off:Icons.visibility,color:primaryColor,size: 20.px,),
                          )

                      ),
                      SizedBox(height: 10.px,),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                          focusNode: controller.focusNewPassword,
                          obscureText: true,
                          title: StringConstants.password,
                          controller: controller.newPasswordController,
                          hintText: StringConstants.newPassword,
                          keyboardType: TextInputType.visiblePassword,
                          isCard: controller.isCurrentPassword.value,
                          suffixIcon: GestureDetector(
                            onTap: (){
                              controller.changeHideVisible();
                            },
                            child:
                            Icon( controller.hide.value?Icons.visibility_off:Icons.visibility,color:primaryColor,size: 20.px,),
                          )

                      ),
                      SizedBox(height: 10.px,),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                          obscureText: true,
                          focusNode: controller.focusCnfPassword,
                          title: StringConstants.confirmPassword,
                          controller: controller.cnfPasswordController,
                          hintText: StringConstants.confirmPassword,
                          keyboardType: TextInputType.visiblePassword,
                          isCard: controller.isCnfPassword.value,
                          suffixIcon: GestureDetector(
                            onTap: (){
                              controller.changeHideVisible();
                            },
                            child:
                            Icon( controller.hide.value?Icons.visibility_off:Icons.visibility,color:primaryColor,size: 20.px,),
                          )

                      ),

                      SizedBox(height: 50.px,),

                    ],
                  ),
                )
              ],
            ),
          );
        })
    );
  }
}
