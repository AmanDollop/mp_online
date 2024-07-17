import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'package:get/get.dart';
import 'package:mp_online/app/data/constants/image_constants.dart';
import 'package:mp_online/common/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/faq_controller.dart';

class FaqView extends GetView<FaqController> {
  const FaqView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:CommonWidgets.appBarView(title:StringConstants.fAQ,),
        body:Obx((){
          controller.count.value;
          return  Column(
            children: [
              SizedBox(height: 10.px,),
              Padding(
                padding: EdgeInsets.only(left: 30.px,right: 30.px),
                child: CommonWidgets.appImagesView(
                    imagePath: ImageConstants.imageFaq,
                  width: double.infinity,height: 140.px,fit: BoxFit.fill
                ),
              ),
              Text(StringConstants.fAQ,style: MyTextStyle.customStyle(fontWeight: FontWeight.bold,fontSize: 30,color:primaryColor),),
              Expanded(
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: showNotificationStatus()),
              )
            ],
          );

        })
    );
  }

  Widget showNotificationStatus(){
    return  ListView.builder(
        padding: EdgeInsets.all(10.px),
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount:controller.questionList.length,
        itemBuilder: (context, index){
          return
            Column(
              children: [
                GestureDetector(
                  onTap: (){
                    controller.changeStatus(index);
                  },
                  child: Container(
                    height: 60.px,
                    padding:  EdgeInsets.all(10.px),
                    margin:  EdgeInsets.all(2.px),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 8,
                            child: Text(controller.questionList[index],style: MyTextStyle.titleStyle14bb,maxLines: 3,)
                        ),
                        Expanded(
                          flex: 1,
                            child: Icon(controller.statusList[index]?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down,size: 25,color: primaryColor,)
                        )


                      ],
                    ),
                  ),
                ),
                if(controller.statusList[index])
                Text(StringConstants.test,style: MyTextStyle.titleStyle12b,textAlign: TextAlign.justify,)
              ],
            );
        });
  }
}

