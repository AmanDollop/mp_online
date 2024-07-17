import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_nav_bar_controller.dart';

class ProviderNavBarView extends GetView<ProviderNavBarController> {
  const ProviderNavBarView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx((){
      controller.count.value;
      return Scaffold(
        bottomNavigationBar: customBottomBar(),
        body:controller.tabs[controller.tabIndex.value],
      );
    });
  }

  Widget customBottomBar(){
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10.px),topRight: Radius.circular(10.px))
      ),
      margin: EdgeInsets.zero,
      color: primary3Color,
      elevation: 5.px,
      clipBehavior: Clip.hardEdge,
      shadowColor: Colors.black54,
      child: Container(
        height: 50.px,
        alignment: Alignment.center,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: (){
                controller.changeTabIndex(0);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonWidgets.appImagesView(
                      imagePath: controller.tabIndex.value==0?IconConstants.icHomeColor:IconConstants.icHome,
                      width: 25.px,height: 25.px,fit: BoxFit.fill
                  ),
                  Text(StringConstants.home,style:controller.tabIndex.value==0?MyTextStyle.customStyle(fontSize: 12,fontWeight: FontWeight.bold,color: primary2Color):MyTextStyle.titleStyle12b,)
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                controller.changeTabIndex(1);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonWidgets.appImagesView(
                      imagePath: controller.tabIndex.value==1?IconConstants.icJobColor:IconConstants.icJob,
                      width: 25.px,height: 25.px,fit: BoxFit.fill
                  ),
                  Text(StringConstants.jobs,style:controller.tabIndex.value==1?MyTextStyle.customStyle(fontSize: 12,fontWeight: FontWeight.bold,color: primary2Color):MyTextStyle.titleStyle12b,)
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                controller.changeTabIndex(2);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonWidgets.appImagesView(
                      imagePath: controller.tabIndex.value==2?IconConstants.icNewsColor:IconConstants.icNews,
                      width: 25.px,height: 25.px,fit: BoxFit.fill
                  ),
                  Text(StringConstants.news,style:controller.tabIndex.value==2?MyTextStyle.customStyle(fontSize: 12,fontWeight: FontWeight.bold,color: primary2Color):MyTextStyle.titleStyle12b,)
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                controller.changeTabIndex(3);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonWidgets.appImagesView(
                      imagePath: controller.tabIndex.value==3?IconConstants.icProfileColor:IconConstants.icProfile,
                      width: 25.px,height: 25.px,fit: BoxFit.fill
                  ),
                  Text(StringConstants.profile,style:controller.tabIndex.value==3?MyTextStyle.customStyle(fontSize: 12,fontWeight: FontWeight.bold,color: primary2Color):MyTextStyle.titleStyle12b,)
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
