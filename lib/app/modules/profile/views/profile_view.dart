
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mp_online/app/data/constants/icons_constant.dart';
import 'package:mp_online/app/data/constants/string_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CommonWidgets.appBarView(title: StringConstants.profile,showBackIcon: false),
      body:Obx((){
        controller.count.value;
        return Padding(
          padding: EdgeInsets.all(10.px),
          child: Column(
            children: [
              ListTile(
                onTap: (){
                  controller.clickOnProfile();
                },
                leading: CommonWidgets.imageView(
                    image:controller.image.value,
                    width: 60.px,height: 60.px,fit: BoxFit.fill,
                    borderRadius: BorderRadius.circular(30.px),
                  defaultNetworkImage: StringConstants.defaultUserImage
                ),
                title: Text(controller.name.value,style: MyTextStyle.titleStyle16bb,),
                subtitle: Text(StringConstants.editProfile,style: MyTextStyle.titleStyle14b,textAlign: TextAlign.start,
                ),
                trailing:CommonWidgets.appImagesView(
                    imagePath:IconConstants.icArrowRight,
                    width: 25.px,height: 25.px,fit: BoxFit.fill,
                    borderRadius: 0.px
                ),
              ),
              SizedBox(height: 5.px,),
              Divider(thickness: 1.px,indent: 10.px,endIndent: 10.px,),
              SizedBox(height: 5.px,),
              Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: showAllItem()),
              ),
            ],
          ),
        );
      }),
    );
  }


  Widget showAllItem(){
    return  ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount:controller.items.length,
        itemBuilder: (context, index){
          return ListTile(
            onTap: (){
              controller.openNewPage(index);
            },
            leading: CommonWidgets.appImagesView(
                imagePath:controller.items[index]['icon']??'',
                width: 40.px,height: 40.px,fit: BoxFit.fill,
                borderRadius: 20.px
            ),
            title: Text(controller.items[index]['name']??'',style: MyTextStyle.titleStyle14bb,),
            trailing:CommonWidgets.appImagesView(
                imagePath:IconConstants.icArrowRight,
                width: 25.px,height: 25.px,fit: BoxFit.fill,
                borderRadius: 0.px
            ),
          );
        });
  }
}
