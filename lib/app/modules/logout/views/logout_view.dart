import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mp_online/common/MyTextStyle.dart';
import 'package:mp_online/common/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/logout_controller.dart';

class LogoutView extends GetView<LogoutController> {
  const LogoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title:StringConstants.logout),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.px)
            ),
            elevation: 5.px,
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.all(20.px),
            child: Padding(
              padding: EdgeInsets.only(top: 20.px,bottom: 20.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(StringConstants.areYouSure,
                    style:MyTextStyle.titleStyle20bb,
                  ),
                  SizedBox(height: 10.px,),
                  Text(StringConstants.doYouWantToLogoutFromTheThisApp,
                    style:MyTextStyle.titleStyle14b,
                  ),
                  SizedBox(height: 40.px,),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                          child: CommonWidgets.commonElevatedButton(
                              onPressed: (){
                             controller.logout();
                              },
                              child: Text(StringConstants.yes,
                                style:MyTextStyle.titleStyle16bw,
                              ),
                            buttonMargin: EdgeInsets.all(10.px),
                            buttonColor: Colors.redAccent,
                            borderRadius: 10.px
                          )
                      ),
                      Expanded(
                          flex: 1,
                          child: CommonWidgets.commonElevatedButton(
                              onPressed: (){

                              },
                              child: Text(StringConstants.no,
                                style:MyTextStyle.titleStyle16bw,
                              ),
                              buttonMargin: EdgeInsets.all(10.px),
                              buttonColor: greenColor,
                            borderRadius: 10.px
                          )
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
