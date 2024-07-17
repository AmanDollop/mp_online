import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import 'package:mp_online/common/MyTextStyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/notification_setting_controller.dart';

class NotificationSettingView extends GetView<NotificationSettingController> {
  const NotificationSettingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CommonWidgets.appBarView(title:StringConstants.document,),
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
          return
            Container(
              height: 65.px,
              padding:  EdgeInsets.all(10.px),
              margin:  EdgeInsets.all(2.px),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Text(controller.notificationName[index],style: MyTextStyle.titleStyle14bb,),
                  FlutterSwitch(
                    width: 55.px,
                    height: 28.px,
                    valueFontSize: 25.px,
                    toggleSize: 20.px,
                    value: controller.statusList[index],
                    borderRadius: 26.px,
                    padding: 4.px,
                    onToggle: (val) {
                      controller.changeStatus(index);
                    },
                  ),

                ],
              ),
            );
        });
  }
}
