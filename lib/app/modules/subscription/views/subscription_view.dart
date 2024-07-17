import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mp_online/common/MyTextStyle.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/subscription_controller.dart';

class SubscriptionView extends GetView<SubscriptionController> {
  const SubscriptionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CommonWidgets.appBarView(title:StringConstants.subscription,),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10.px),
              child: Text(StringConstants.subscriptionDescription,style: MyTextStyle.customStyle(fontSize: 13,
                  fontWeight: FontWeight.w700,color: Colors.black87),),
            ),
            Padding(
              padding: EdgeInsets.all(10.px),
              child: Text(StringConstants.findTheBestSubscriptionPlanThatBestSuitsYourGoals,style: MyTextStyle.titleStyle12b,),
            ),
            showAllSubscriptionPlan()
          ],
        ),
      ),
    );
  }

  Widget showAllSubscriptionPlan(){
    return  ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount:controller.subscriptionList.length,
        itemBuilder: (context, index){
          return
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.px))
              ),
              semanticContainer: true,
              clipBehavior: Clip.hardEdge,
              elevation: 5.px,
              color: primary3Color,
              shadowColor: primary3Color,
              margin: EdgeInsets.all(10.px),
              child: SizedBox(
                height: 200.px,width:double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CommonWidgets.appImagesView(
                        imagePath:index%2==0?ImageConstants.imageSubscription1:ImageConstants.imageSubscription2 ,
                        height: 200.px,
                        fit: BoxFit.fill
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          Text('MP ON 9',style: MyTextStyle.titleStyle30bw,),
                          Text(controller.subscriptionList[index]['amount']??'',style: MyTextStyle.titleStyle30bw,),
                          Text(controller.subscriptionList[index]['name']??'',style: MyTextStyle.customStyle(fontWeight: FontWeight.bold,
                          fontSize: 14,color: Colors.blue),),
                          Text(controller.subscriptionList[index]['description']??'',style: MyTextStyle.titleStyle12bw,),
                          SizedBox(height: 10.px,)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
        });
  }
}
