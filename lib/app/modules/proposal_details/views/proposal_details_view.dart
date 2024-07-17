import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mp_online/common/colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/proposal_details_controller.dart';

class ProposalDetailsView extends GetView<ProposalDetailsController> {
  const ProposalDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx((){
      controller.count.value;
      return Scaffold(
        appBar:CommonWidgets.appBarView(title: StringConstants.mySubmittedProposal),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:Container(
              margin:  EdgeInsets.all(15.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 2.px,vertical: 2.px),
                    leading: CommonWidgets.appImagesView(
                        imagePath:IconConstants.icDocument,
                        width: 40.px,height: 40.px,fit: BoxFit.fill,
                        borderRadius:20.px
                    ),
                    title: Text('${controller.getMySubmittedProposalData.postData!.phone}',style: MyTextStyle.titleStyle16bb,),
                    subtitle: Text('${controller.getMySubmittedProposalData.postData!.email}',style: MyTextStyle.titleStyle16bb,),

                  ),
                  SizedBox(height: 5.px,),
                  Text('${controller.getMySubmittedProposalData.postData!.serviceName}',style: MyTextStyle.titleStyle16bb,),
                  SizedBox(height: 10.px,),
                  Text(StringConstants.postDate,style: MyTextStyle.titleStyle14bb,),
                  Text(controller.getMySubmittedProposalData.postData!.dateTime.toString().substring(0,10),style: MyTextStyle.titleStyle12b,),
                  SizedBox(height: 10.px,),
                  Text(StringConstants.budgetAmount,style: MyTextStyle.titleStyle14bb,),
                  Text('${controller.getMySubmittedProposalData.postData!.budgetAmount}',style: MyTextStyle.titleStyle12b,),
                  SizedBox(height: 10.px,),
                  Text(StringConstants.address,style: MyTextStyle.titleStyle14bb,),
                  Text('${controller.getMySubmittedProposalData.postData!.address}',style: MyTextStyle.titleStyle12b,),
                  SizedBox(height: 10.px,),
                  Text(StringConstants.selectCopyType,style: MyTextStyle.titleStyle14bb,),
                  Text('${controller.getMySubmittedProposalData.postData!.selectCopy}',style: MyTextStyle.titleStyle12b,),
                  SizedBox(height: 10.px,),
                  Text(StringConstants.time,style: MyTextStyle.titleStyle14bb,),
                  Text('${controller.getMySubmittedProposalData.postData!.time}',style: MyTextStyle.titleStyle12b,),
                  SizedBox(height: 10.px,),
                  Text(StringConstants.description,style: MyTextStyle.titleStyle14bb,),
                  Text('${controller.getMySubmittedProposalData.postData!.description}',style: MyTextStyle.titleStyle12b,),
                  SizedBox(height: 15.px,),
                  Text(StringConstants.myProposal,style: MyTextStyle.customStyle(fontSize: 16,fontWeight: FontWeight.bold,color: primaryColor),),
                  SizedBox(height: 5.px,),
                  Text(StringConstants.budgetAmount,style: MyTextStyle.titleStyle14bb,),
                  Text('${controller.getMySubmittedProposalData.budgetAmount}',style: MyTextStyle.titleStyle12b,),
                  SizedBox(height: 10.px,),
                  Text(StringConstants.time,style: MyTextStyle.titleStyle14bb,),
                  Text('${controller.getMySubmittedProposalData.time}',style: MyTextStyle.titleStyle12b,),
                  SizedBox(height: 10.px,),
                  Text(StringConstants.description,style: MyTextStyle.titleStyle14bb,),
                  Text('${controller.getMySubmittedProposalData.description}',style: MyTextStyle.titleStyle12b,),
                  SizedBox(height: 10.px,),
                ],
              ),
            )
        ),
      );
    });
  }

}
