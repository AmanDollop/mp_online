import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mp_online/common/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:CommonWidgets.appBarView(title:StringConstants.notifications,
        action: [
          Padding(
              padding: EdgeInsets.only(right: 20.px),
            child: GestureDetector(
              onTap: (){
                controller.clickOnSettingIcon();
              },
              child: Icon(Icons.settings,size: 25.px,color: primary3Color,),
            ),
          )
        ]),
        body:Obx((){
          controller.count.value;
          return  Column(
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: showNotificationStatus())
            ],
          );

        })
    );
  }

  Widget showNotificationStatus(){
    return  ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount:controller.notificationName.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: Icon(Icons.notifications,size: 25.px,color: primaryColor,),
            title:Text(controller.notificationName[index]['title']??'',style: MyTextStyle.titleStyle14bb,),
            subtitle:Text(controller.notificationName[index]['message']??'',style: MyTextStyle.titleStyle12b,maxLines: 2,),
            trailing:Text('10 min\n ago',style: MyTextStyle.titleStyle12b,),
          );
        });
  }
}

