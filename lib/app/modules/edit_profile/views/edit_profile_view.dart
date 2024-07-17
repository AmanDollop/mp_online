import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mp_online/app/data/constants/string_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBarView(title:StringConstants.profile,showBackIcon: true),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      CommonWidgets.appImagesView(
                          imagePath: ImageConstants.imageBoy,
                          width: 100.px,height: 100.px,fit: BoxFit.fill,
                          borderRadius: 50.px
                      ),
                      Text('Kaylynn Stanton',
                        style: MyTextStyle.titleStyle20bb),
                      Text('testJohn@gmail.com',
                        style: MyTextStyle.titleStyle14b,textAlign: TextAlign.center,),
                      SizedBox(height: 20.px,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(StringConstants.personalInfo,
                          style: MyTextStyle.titleStyle16bb,),
                      ),
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
                          focusNode: controller.focusPhone,
                          title: StringConstants.phoneNo,
                          controller: controller.phoneController,
                          hintText: StringConstants.enterYourMobileNumber,
                          keyboardType: TextInputType.phone,
                          isCard: controller.isPhone.value,
                          prefixIcon: Text('+ 91',style: MyTextStyle.titleStyle16bb,)

                      ),

                      SizedBox(height: 60.px,),
                      CommonWidgets.commonElevatedButton(
                          onPressed: (){
                            // controller.clickOnLogInButton();
                          },
                          child:Text(StringConstants.update,style: MyTextStyle.titleStyle20bw,),
                          borderRadius: 10.px
                      ),
                      SizedBox(height: 20.px,),

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