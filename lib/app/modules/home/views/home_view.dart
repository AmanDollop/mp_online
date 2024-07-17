
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mp_online/app/data/constants/icons_constant.dart';
import 'package:mp_online/app/data/constants/string_constants.dart';
import 'package:mp_online/common/MyTextStyle.dart';
import 'package:mp_online/common/colors.dart';
import 'package:mp_online/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/apis/api_methods/get_tutar_enquiry_model.dart';
import '../../../data/apis/api_models/get_my_project_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return  Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          title:Container(
            height: 42.px,
            padding: EdgeInsets.all(5.px),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.px),
                color:primary3Color
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CommonWidgets.appImagesView(
                    imagePath: IconConstants.icSearch,width: 20.px,height: 20.px,fit: BoxFit.fill),
                Expanded(child: Text(StringConstants.searchJobsSkillPeople,style: MyTextStyle.titleStyle12b,overflow: TextOverflow.ellipsis,))
              ],
            ),
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: (){
                controller. clickOnMessageIcon();
              },
              child: Padding(
                padding:  EdgeInsets.only(left: 10.px,right: 5.px),
                child: CommonWidgets.appImagesView(
                    imagePath: IconConstants.icChat,
                    width: 42.px,height: 42.px,fit: BoxFit.fill
                ),
              ),
            ),
            GestureDetector(
              onTap: (){

              },
              child: Padding(
                padding:  EdgeInsets.only(left: 10.px,right: 15.px),
                child: CommonWidgets.appImagesView(
                    imagePath: IconConstants.icNotification,
                    width: 42.px,height: 42.px,fit: BoxFit.fill
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: controller.userType==StringConstants.provider?showAllProjects():showTutarEnquiry()
        ),
      );
    });
  }


  Widget showAllProjects(){
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
            itemCount:controller.allProjectList.length,
            itemBuilder: (context, index){
              GetMyProjectData item=controller.allProjectList[index];
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 2.px,vertical: 0.px),
                          leading: CommonWidgets.imageView(
                              image:item.userData?.image??'',
                              width: 40.px,height: 40.px,fit: BoxFit.fill,
                              borderRadius: BorderRadius.circular(20.px)
                          ),
                          title: Text('${item.userData?.firstName ?? ''} ${item.userData?.lastName ?? ''}',style: MyTextStyle.titleStyle16bb,),
                          trailing: Text(item.dateTime.toString().substring(0,10),style: MyTextStyle.titleStyle12b,textAlign: TextAlign.end,),
                        ),
                        SizedBox(height: 5.px,),
                        Text('${item.serviceName}',style: MyTextStyle.titleStyle16bb,),
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
        if(controller.allProjectList.isEmpty)
          CommonWidgets.dataNotFound()
      ],
    );
  }


  Widget showTutarEnquiry(){
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
            itemCount:controller.getTutarEnquiryData.length,
            itemBuilder: (context, index){
              GetTutarEnquiryData item = controller.getTutarEnquiryData[index];
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 2.px,vertical: 0.px),
                          leading: CommonWidgets.imageView(
                              image:item.userData!.image??'',
                              width: 40.px,height: 40.px,fit: BoxFit.fill,
                              borderRadius: BorderRadius.circular(20.px)
                          ),
                          title: Text('${item.userData!.firstName} ${item.userData!.lastName}',style: MyTextStyle.titleStyle16bb,),
                          trailing: Text(item.datetime.toString().substring(0,10),style: MyTextStyle.titleStyle12b,textAlign: TextAlign.end,),
                        ),
                        SizedBox(height: 5.px,),
                        Text('${item.studentName}',style: MyTextStyle.titleStyle16bb,),
                        SizedBox(height: 5.px,),
                        Text('${item.educationalType}',style: MyTextStyle.titleStyle12b,maxLines: 5,
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
        if(controller.getTutarEnquiryData.isEmpty)
          CommonWidgets.dataNotFound()
      ],
    );
  }
}
