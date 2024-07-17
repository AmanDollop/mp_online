import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_models/get_proposal_at_my_project_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/project_detail_proposal_controller.dart';

class ProjectDetailProposalView
    extends GetView<ProjectDetailProposalController> {
  const ProjectDetailProposalView({super.key});
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
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      controller.tabIndex.value==0?
                      details():proposal(),
                    ],
                  ),
                ),
              )

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
          Text('${controller.getMyProjectData.serviceName}',style: MyTextStyle.titleStyle16bb,),
          SizedBox(height: 10.px,),
          Text(StringConstants.postDate,style: MyTextStyle.titleStyle14bb,),
          Text(controller.getMyProjectData.dateTime.toString().substring(0,10),style: MyTextStyle.titleStyle12b,),
          SizedBox(height: 10.px,),
          Text(StringConstants.budgetAmount,style: MyTextStyle.titleStyle14bb,),
          Text('${controller.getMyProjectData.budgetAmount}',style: MyTextStyle.titleStyle12b,),
          SizedBox(height: 10.px,),
          Text(StringConstants.address,style: MyTextStyle.titleStyle14bb,),
          Text('${controller.getMyProjectData.address}',style: MyTextStyle.titleStyle12b,),
          SizedBox(height: 10.px,),
          Text(StringConstants.selectCopyType,style: MyTextStyle.titleStyle14bb,),
          Text('${controller.getMyProjectData.selectCopy}',style: MyTextStyle.titleStyle12b,),
          SizedBox(height: 10.px,),
          Text(StringConstants.time,style: MyTextStyle.titleStyle14bb,),
          Text('${controller.getMyProjectData.time}',style: MyTextStyle.titleStyle12b,),
          SizedBox(height: 10.px,),
          Text(StringConstants.description,style: MyTextStyle.titleStyle14bb,),
          Text('${controller.getMyProjectData.description}',style: MyTextStyle.titleStyle12b,),
          SizedBox(height: 15.px,),

          ListTile(
            leading: CommonWidgets.appImagesView(
                imagePath: IconConstants.icFile,
                width: 30.px,height: 30.px,fit: BoxFit.fill,
                borderRadius: 0.px
            ),
            title: Text(StringConstants.downloadProjectRequirement,style: MyTextStyle.titleStyle14b,),
            trailing:GestureDetector(
              onTap: (){
                controller.downloadFile(controller.getMyProjectData.documentGallery![0].image??'');
              },
              child: CommonWidgets.appImagesView(
                  imagePath: IconConstants.icDownload,
                  width: 25.px,height: 25.px,fit: BoxFit.fill,
                  borderRadius: 0.px
              ),
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
          SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: showAllProposal()
          ),
          SizedBox(height: 20.px,),
        ],
      ),
    );
  }

  Widget showAllProposal(){
    return controller.isLoading.value?
    CommonWidgets.commonShimmer(
      itemCount: 4,
    ):ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount:controller.proposalList.length,
        itemBuilder: (context, index){
          ProposalAtMyProjectData item=controller.proposalList[index];
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
                height: 265.px,
                padding:  EdgeInsets.only(left:10.px,right: 10.px,bottom: 5.px,top: 0.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CommonWidgets.imageView(
                          image:item.userData![0].image??'',
                          width: 40.px,height: 40.px,fit: BoxFit.fill,
                          borderRadius:BorderRadius.circular(20.px),defaultNetworkImage: StringConstants.defaultUserImage
                      ),
                      title: Text('${item.userData![0].firstName} ${item.userData![0].lastName}',style: MyTextStyle.titleStyle16bb,),
                      trailing: Text(item.dateTime.toString().substring(0,10),style: MyTextStyle.titleStyle12b,textAlign: TextAlign.end,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.getMyProjectData.serviceName??'',style: MyTextStyle.titleStyle16bb,) ,
                        GestureDetector(
                          onTap: (){
                            controller.clickOnChatButton(index);
                          },
                          child: CommonWidgets.appImagesView(
                              imagePath: IconConstants.icChat,
                              width: 40.px,height: 40.px,fit: BoxFit.fill,
                              borderRadius: 2.px
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.px,),
                    Row(
                      children: [
                        Text(StringConstants.time,style: MyTextStyle.titleStyle14bb,),
                        SizedBox(width: 5.px,),
                        Text('${item.time}',style: MyTextStyle.titleStyle12b,),
                      ],
                    ),

                    SizedBox(height: 10.px,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(StringConstants.budgetAmount,style: MyTextStyle.titleStyle14bb,),
                        SizedBox(width: 5.px,),
                        Text('${item.budgetAmount}',style: MyTextStyle.titleStyle12b,),
                      ],
                    ),

                    Text(controller.getMyProjectData.description??'',style: MyTextStyle.titleStyle12b,maxLines: 5,
                      overflow: TextOverflow.ellipsis,),
                    SizedBox(height: 5.px,),

                  ],
                ),
              ),
            );
        });
  }
}
