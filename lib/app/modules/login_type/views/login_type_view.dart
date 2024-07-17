import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mp_online/app/data/constants/icons_constant.dart';
import 'package:mp_online/app/data/constants/image_constants.dart';
import 'package:mp_online/app/data/constants/string_constants.dart';
import 'package:mp_online/common/MyTextStyle.dart';
import 'package:mp_online/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/login_type_controller.dart';

class LoginTypeView extends GetView<LoginTypeController> {
  const LoginTypeView({super.key});
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height:size.height*0.7 ,
                width: double.infinity,
                child:CommonWidgets.appImagesView(
                    imagePath: ImageConstants.imageBird,
                   fit: BoxFit.fill
                ),
              ),
              SizedBox(
                height:size.height*0.7 ,
                width: double.infinity,
                child:CommonWidgets.appImagesView(
                    imagePath: ImageConstants.imageTypeBackGround,
                   fit: BoxFit.fill
                ),
              ),
            ],
          ),
          Container(
            child: Column(
              children: [
                Text(StringConstants.chooseYourAccountType,
                  style:MyTextStyle.titleStyle18bb,
                ),
                SizedBox(height: 10.px,),
                CommonWidgets.commonElevatedButton(
                    onPressed: (){
                    controller.clickOnUserButton();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      CommonWidgets.appImagesView(
                          imagePath: IconConstants.icProfileColor,
                        width: 25.px,
                        height: 25.px,
                        fit: BoxFit.fill
                      ),
                        SizedBox(width: 5.px,),
                        Text(StringConstants.user,
                          style:MyTextStyle.titleStyle16bw,
                        ),
                      ],
                    ),
                    borderRadius: 10.px,
                  buttonMargin: EdgeInsets.only(left: 20.px,right: 20.px,top: 10.px,bottom: 10.px)
                ),
                CommonWidgets.commonElevatedButton(
                    onPressed: (){
                     controller.clickOnProviderButton();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      CommonWidgets.appImagesView(
                          imagePath: IconConstants.icProvider,
                        width: 25.px,
                        height: 25.px,
                        fit: BoxFit.fill
                      ),
                        SizedBox(width: 5.px,),
                        Text(StringConstants.provider,
                          style:MyTextStyle.titleStyle16bw,
                        ),
                      ],
                    ),
                    borderRadius: 10.px,
                  buttonMargin: EdgeInsets.only(left: 20.px,right: 20.px,top: 10.px,bottom: 10.px)
                ),

              ],
            ),
          )

        ],
      ),
    );
  }
}
