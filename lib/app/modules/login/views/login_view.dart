import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:mp_online/app/data/constants/icons_constant.dart';
import 'package:mp_online/app/data/constants/string_constants.dart';
import 'package:mp_online/common/MyTextStyle.dart';
import 'package:mp_online/common/colors.dart';
import 'package:mp_online/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: ''),
   resizeToAvoidBottomInset: false,
      body:Obx((){
        controller.count.value;
        return Column(
          children: [
         Container(
           margin: EdgeInsets.all(20.px),
           child: Column(
             children: [
               SizedBox(height: 30.px,),
               Text(StringConstants.enterYourMobileNumber,
               style: MyTextStyle.customStyle(fontWeight: FontWeight.bold,fontSize: 22.px),textAlign: TextAlign.center,),
               SizedBox(height: 20.px,),
               Text(StringConstants.pleaseConfirmYourCountryCodeAndEnterYouMobileNumber,
                 style: MyTextStyle.titleStyle14b,textAlign: TextAlign.center,),
               SizedBox(height: 30.px,),
               CommonWidgets.commonTextFieldForLoginSignUP(
                 title: StringConstants.phoneNo,
                 controller: controller.phoneNumber,
                 hintText: StringConstants.enterYourMobileNumber,
                 keyboardType: TextInputType.phone,
                 isCard: true,
                 prefixIcon: Text('+ 91',style: MyTextStyle.titleStyle16bb,)
                 
               ),
               SizedBox(height: 50.px,),
               CommonWidgets.commonElevatedButton(
                   onPressed: (){
                    controller.clickOnLogInButton();
                   },
                   child:Text(StringConstants.login,style: MyTextStyle.titleStyle20bw,),
                 borderRadius: 10.px,
                 isLoading: controller.isLoading.value
               ),
               SizedBox(height: 20.px,),
               Text(StringConstants.or,
                 style: MyTextStyle.titleStyle16bb,textAlign: TextAlign.center,),
               SizedBox(height: 20.px,),
               Text(StringConstants.loginWith,
                 style: MyTextStyle.titleStyle16bb,textAlign: TextAlign.center,),
               SizedBox(height: 20.px,),
               CommonWidgets.appImagesView(
                   imagePath: IconConstants.icGoogle,
                 width: 30.px,height: 30.px,
                 fit: BoxFit.fill
               ),
              SizedBox(height: 30.px,),
               GestureDetector(
                 onTap: (){
                   controller.clickOnSignUp();
                 },
                 child: RichText(
                     text:  TextSpan(
                         style: const TextStyle(fontWeight: FontWeight.bold),
                         //apply style to all
                         children: [
                           TextSpan(
                               text:StringConstants.doNotHaveAnAccount,
                               style:MyTextStyle.titleStyle14bb),
                           const TextSpan(
                               text:StringConstants.signUp,
                               style: TextStyle(
                                   fontSize: 16, color: primary2Color),
                           ),
                         ])),
               ),

             ],
           ),
         )
          ],
        );
      })
    );
  }
}
