import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mp_online/common/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CommonWidgets.appBarView(title: ''),
        body:Obx((){
          controller.count.value;
          return Column(
            children: [
              Container(
                margin: EdgeInsets.all(20.px),
                child: Column(
                  children: [
                    SizedBox(height: 30.px,),
                    Text(StringConstants.verifyPhoneNumber,
                      style: MyTextStyle.customStyle(fontWeight: FontWeight.bold,fontSize: 22.px),textAlign: TextAlign.center,),
                    SizedBox(height: 20.px,),
                    Text(StringConstants.checkYourSmsMessageWeHaveSendYouThePin,
                      style: MyTextStyle.titleStyle14b,textAlign: TextAlign.center,),

                    SizedBox(height: 20.px,),
                    CommonWidgets.commonOtpView(controller: controller.pinController),
                    /*SizedBox(height: 20.px,),
                    SizedBox(
                      width: double.infinity,
                      height: 50.px,
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OtpInput(controller.fieldOne, true), // auto focus
                          OtpInput(controller.fieldTwo, false),
                          OtpInput(controller.fieldThree, false),
                          OtpInput(controller.fieldFour, false),
                          OtpInput(controller.fieldFive, false),
                          OtpInput(controller.fieldSix, false),
                        ],
                      ),
                    ),*/
                    SizedBox(height: 50.px,),
                    CommonWidgets.commonElevatedButton(
                        onPressed: (){
                          FocusManager.instance.primaryFocus?.unfocus();
                          //controller.clickOnCheckOtpButton();
                          controller.firebaseOtpWithVerification();
                        },
                        child:Text(StringConstants.submit,style: MyTextStyle.titleStyle20bw,),
                        borderRadius: 10.px,
                      isLoading: controller.isLoading.value
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
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 393;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return SizedBox(
      height: 60*fem,
      width: 50*fem,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration:InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.px)),
            counterText: '',
            hintStyle: const TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
