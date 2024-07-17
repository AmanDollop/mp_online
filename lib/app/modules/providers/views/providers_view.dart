import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mp_online/app/data/apis/api_models/get_providers_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/providers_controller.dart';

class ProvidersView extends GetView<ProvidersController> {
  const ProvidersView({super.key});
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
            child: showAllProjects()
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
            itemCount:controller.allProvidersList.length,
            itemBuilder: (context, index){
              GetProviderData item=controller.allProvidersList[index];
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
                  child: SizedBox(
                    height: 270.px,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CommonWidgets.imageView(
                            image:item.shopBanner??'',
                            width:double.infinity,height: 155.px,fit: BoxFit.fill,
                            borderRadius: BorderRadius.circular(0.px),
                            defaultNetworkImage: StringConstants.defaultMpOnlineShopBanner
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(horizontal: 3.px,vertical: 0.px),
                          leading: CommonWidgets.imageView(
                              image:item.shopBanner??'',
                              width: 50.px,height: 50.px,fit: BoxFit.fill,
                              borderRadius: BorderRadius.circular(25.px),
                            defaultNetworkImage: StringConstants.defaultUserImage

                          ),
                          title: Text('${item.firstName} ${item.lastName}',style: MyTextStyle.titleStyle16bb,),
                          subtitle: Text('${item.shopAddress}',style: MyTextStyle.titleStyle12b,),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap:(){
                              controller.clickOnChatIcon(index);
                               },
                              child: Container(
                                height: 35.px,
                                  width: 35.px,
                                margin: EdgeInsets.only(left: 18.px),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.px),
                                  color: primary3Color
                                ),
                                child:CommonWidgets.appImagesView(
                                    imagePath: IconConstants.icChat,
                                  height: 35.px,width: 35.px,fit: BoxFit.fill
                                ),
                              ),
                            ),

                            GestureDetector(
                              onTap:(){
                                controller.clickOnMoreDetails(index);
                              },
                              child: Container(
                                height: 35.px,
                                width: 100.px,
                                  margin: EdgeInsets.only(right: 20.px),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.px),
                                    color: primaryColor
                                ),
                                child:Text(StringConstants.moreDetails,style: MyTextStyle.titleStyle12bw,)
                              ),
                            ),
                          ],
                        )

                      ],
                    ),
                  ),
                );
            }),
        if(controller.allProvidersList.isEmpty)
          CommonWidgets.dataNotFound()
      ],
    );
  }
}
