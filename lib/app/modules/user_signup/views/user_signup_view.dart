
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mp_online/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/user_signup_controller.dart';

class UserSignupView extends GetView<UserSignupController> {
  const UserSignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: ''),
        resizeToAvoidBottomInset: false,
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
                      Text(StringConstants.signUp,
                        style: MyTextStyle.customStyle(fontWeight: FontWeight.bold,fontSize: 32.px),textAlign: TextAlign.center,),
                      SizedBox(height: 5.px,),
                      Text(StringConstants.startYourJourney,
                        style: MyTextStyle.titleStyle14b,textAlign: TextAlign.center,),
                      SizedBox(height: 10.px,),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusFirstName,
                          title: StringConstants.firstName,
                          controller: controller.firstNameController,
                          hintText: StringConstants.enterYourFirstName,
                          keyboardType: TextInputType.name,
                          isCard: controller.isFirstName.value,

                      ),
                      SizedBox(height: 10.px,),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                         focusNode: controller.focusLastName,
                          title: StringConstants.lastName,
                          controller: controller.lastNameController,
                          hintText: StringConstants.enterYourLastName,
                          keyboardType: TextInputType.name,
                          isCard: controller.isLastName.value,

                      ),
                      SizedBox(height: 10.px,),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusEmail,
                        title: StringConstants.email,
                        controller: controller.emailController,
                        hintText: StringConstants.enterYourEmailId,
                        keyboardType: TextInputType.emailAddress,
                        isCard: controller.isEmail.value,

                      ),
                      SizedBox(height: 10.px,),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                          focusNode: controller.focusPhone,
                          title: StringConstants.phoneNo,
                          controller: controller.phoneController,
                          hintText: StringConstants.enterYourMobileNumber,
                          keyboardType: TextInputType.phone,
                          isCard: controller.isPhone.value,
                          prefixIcon: Text('+ 91',style: MyTextStyle.titleStyle16bb,)

                      ),

                      SizedBox(height: 10.px,),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                          focusNode: controller.focusPassword,
                          obscureText: true,
                          title: StringConstants.password,
                          controller: controller.passwordController,
                          hintText: StringConstants.enterYourYourPassword,
                          keyboardType: TextInputType.visiblePassword,
                          isCard: controller.isPassword.value,
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
                          hintText: StringConstants.enterYourConformPassword,
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

                      SizedBox(height: 20.px,),
                      RichText(
                          text:  TextSpan(
                              style: const TextStyle(fontWeight: FontWeight.bold),
                              //apply style to all
                              children: [
                                TextSpan(
                                    text:StringConstants.bySigningUpYouAreAcknowledgingThatYouHaveRead,
                                    style:MyTextStyle.titleStyle14b),
                                const TextSpan(
                                    text:StringConstants.termsOfService,
                                    style: TextStyle(
                                        fontSize: 16, color: primary2Color)),
                                TextSpan(
                                    text:StringConstants.and,
                                    style:MyTextStyle.titleStyle14b),
                                const TextSpan(
                                    text:StringConstants.privacyPolicy,
                                    style: TextStyle(
                                        fontSize: 16, color: primary2Color)),
                              ])),
                      SizedBox(height: 20.px,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 25.px,
                            width: 25.px,
                            margin: EdgeInsets.all(5.px),
                            child:Checkbox(
                              value: controller.checked.value,
                              onChanged: (bool? value) {
                                controller.changeCheckBox();
                              },
                            ),
                          ),
                          Expanded(
                              child:Text(StringConstants.iAgreeWithTheTermsAndConditions,
                                style: MyTextStyle.titleStyle12b,textAlign: TextAlign.justify,
                              )
                          )
                        ],
                      ),
                      SizedBox(height: 50.px,),
                      CommonWidgets.commonElevatedButton(
                          onPressed: (){
                           controller.clickOnSubmitButton();
                          },
                          child:Text(StringConstants.signUp,style: MyTextStyle.titleStyle20bw,),
                          borderRadius: 10.px,
                           isLoading: controller.isLoading.value
                      ),
                      SizedBox(height: 20.px,),
                      GestureDetector(
                        onTap: (){
                          controller.clickOnLogIn();
                        },
                        child: RichText(
                            text:  TextSpan(
                                style: const TextStyle(fontWeight: FontWeight.bold),
                                //apply style to all
                                children: [
                                  TextSpan(
                                      text:StringConstants.iHaveAlreadyAccount,
                                      style:MyTextStyle.titleStyle14bb),
                                  const TextSpan(
                                    text:StringConstants.login,
                                    style: TextStyle(
                                        fontSize: 16, color: primary2Color),
                                  ),
                                ])),
                      ),
                      SizedBox(height: 30.px,),

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
