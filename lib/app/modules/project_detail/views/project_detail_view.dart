import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:mp_online/app/data/constants/icons_constant.dart';
import 'package:mp_online/app/data/constants/string_constants.dart';
import 'package:mp_online/common/MyTextStyle.dart';
import 'package:mp_online/common/colors.dart';
import 'package:mp_online/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/project_detail_controller.dart';

class ProjectDetailView extends GetView<ProjectDetailController> {
  const ProjectDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:CommonWidgets.appBarView(title:StringConstants.details,),
      body:Obx((){
        controller.count.value;
        return  Column(
          children: [
            SizedBox(height: 10.px,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    controller.clickOnTab(0);
                  },
                  child: Column(
                    children: [
                      Text(StringConstants.details,style: controller.tabIndex.value==0?MyTextStyle.titleStyle16bb:MyTextStyle.titleStyle16b,),
                      SizedBox(height: 4.px,),
                      Container(
                        width: 50.px,
                        height: 3.px,
                        decoration: BoxDecoration(
                          color:controller.tabIndex.value==0?primaryColor:primary3Color ,
                          borderRadius: BorderRadius.circular(1.5.px)
                        ),

                      )

                    ],
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    controller.clickOnTab(1);
                  },
                  child: Column(
                    children: [
                      Text(StringConstants.proposal,style: controller.tabIndex.value==1?MyTextStyle.titleStyle16bb:MyTextStyle.titleStyle16b,),
                      SizedBox(height: 4.px,),
                      Container(
                        width: 50.px,
                        height: 3.px,
                        decoration: BoxDecoration(
                            color:controller.tabIndex.value==1?primaryColor:primary3Color ,
                            borderRadius: BorderRadius.circular(1.5.px)
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
            controller.tabIndex.value==0?
            details():proposal(),
          ],
        );
      })
    );
  }

  Widget details(){
    return Container(
      margin: EdgeInsets.all(15.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5.px,),
          Text(controller.getMyProjectData.serviceName??'',style: MyTextStyle.titleStyle16bb,),
          SizedBox(height: 5.px,),
          Text(controller.getMyProjectData.description??'',style: MyTextStyle.titleStyle12b,
            ),
          SizedBox(height: 5.px,),
          Text('\$ ${controller.getMyProjectData.budgetAmount}',style: MyTextStyle.titleStyle16bb,),

          ListTile(
            onTap: (){
              controller.downloadFile(controller.getMyProjectData.documentGallery![0].image??'');

            },
            leading: CommonWidgets.appImagesView(
                imagePath: IconConstants.icFile,
                width: 30.px,height: 30.px,fit: BoxFit.fill,
                borderRadius: 0.px
            ),
            title: Text(StringConstants.downloadProjectRequirement,style: MyTextStyle.titleStyle14b,),
            trailing:CommonWidgets.appImagesView(
                imagePath: IconConstants.icDownload,
                width: 25.px,height: 25.px,fit: BoxFit.fill,
                borderRadius: 0.px
            ),
          ),
        ],
      ),
    );
  }
  
  Widget proposal(){
    return Container(
      margin: EdgeInsets.all(15.px),
      child: Column(
        children: [
          SizedBox(height: 10.px,),
          CommonWidgets.commonTextFieldForLoginSignUP(
            focusNode: controller.focusBudget,
            title: StringConstants.budgetAmount,
            controller: controller.budgetController,
            hintText: StringConstants.budgetAmount,
            keyboardType: TextInputType.name,
            isCard: controller.isBudget.value,
          ),
          SizedBox(height: 10.px,),
          CommonWidgets.commonTextFieldForLoginSignUP(
            focusNode: controller.focusTime,
            title: StringConstants.time,
            controller: controller.timeController,
            hintText: StringConstants.time,
            keyboardType: TextInputType.name,
            isCard: controller.isTime.value,
          ),
          SizedBox(height: 10.px,),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(StringConstants.description,style: MyTextStyle.titleStyle14bb,)),
          SizedBox(height: 2.px,),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.px),
                border: Border.all(color:controller.isDescription.value?primaryColor:Colors.black54,width: 1.px)
            ),
            child: TextFormField(
              controller: controller.descriptionController,
              maxLines: 10,
              focusNode: controller.focusDescription,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 5.px,vertical: 3.px),
                  hintText: StringConstants.description,
                  hintStyle: MyTextStyle.titleStyle14b
              ),
            ),
          ),
          SizedBox(height: 20.px,),
          CommonWidgets.commonElevatedButton(
              onPressed: (){
              controller.clickOnSendRequestButton();
              },
              child: Text(StringConstants.sendRequest,style: MyTextStyle.titleStyle16bw,),
            isLoading: controller.isLoading.value
          )
        ],
      ),
    );
  }


}
