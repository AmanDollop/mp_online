import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_models/get_my_submited_proposal_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_proposals_controller.dart';

class ProviderProposalsView extends GetView<ProviderProposalsController> {
  const ProviderProposalsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx((){
      controller.count.value;
      return Scaffold(
        appBar:CommonWidgets.appBarView(title: StringConstants.mySubmittedProposal),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: showAllProposal()
        ),
      );
    });
  }


  Widget showAllProposal(){
    return  controller.isLoading.value?
    CommonWidgets.commonShimmer(
      itemCount: 4,
    ):
    Column(
      children: [
        ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount:controller.myProposalList.length,
            itemBuilder: (context, index){
              GetMySubmittedProposalData item=controller.myProposalList[index];
              return
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.px))
                  ),
                  semanticContainer: true,
                  clipBehavior: Clip.hardEdge,
                  elevation: 5.px,
                  color: primary3Color,
                  shadowColor: primary3Color,
                  margin: EdgeInsets.all(10.px),
                  child: Container(
                    height: 250.px,
                    padding:  EdgeInsets.all(10.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ListTile(
                          leading: CommonWidgets.appImagesView(
                              imagePath:IconConstants.icDocument,
                              width: 40.px,height: 40.px,fit: BoxFit.fill,
                              borderRadius:20.px
                          ),
                          title: Text('${item.postData!.phone}',style: MyTextStyle.titleStyle16bb,),
                          subtitle: Text('${item.postData!.email}',style: MyTextStyle.titleStyle16bb,),
                          trailing: Text(item.postData!.dateTime.toString().substring(0,10),style: MyTextStyle.titleStyle12b,textAlign: TextAlign.end,),
                        ),
                        SizedBox(height: 5.px,),
                        Text('${item.postData!.serviceName}',style: MyTextStyle.titleStyle16bb,),
                        SizedBox(height: 5.px,),
                        Text('${item.description}',style: MyTextStyle.titleStyle12b,maxLines: 5,
                          overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 5.px,),
                        CommonWidgets.commonElevatedButton(
                            onPressed: (){
                              controller.clickOnMoreDetailButton(index);
                            },
                            child: Text(StringConstants.moreDetails,style:MyTextStyle.titleStyle16bw,),
                            borderRadius: 10.px
                        )
                      ],
                    ),
                  ),
                );
            }),
        if(controller.myProposalList.isEmpty)
          CommonWidgets.dataNotFound()
      ],
    );
  }
}