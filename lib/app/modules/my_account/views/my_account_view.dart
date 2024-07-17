import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_models/get_my_project_model.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/my_account_controller.dart';

class MyAccountView extends GetView<MyAccountController> {
  const MyAccountView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx((){
      controller.count.value;
      return Scaffold(
        appBar:CommonWidgets.appBarView(title: StringConstants.myAccount),
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
            itemCount:controller.myProjectList.length,
            itemBuilder: (context, index){
              GetMyProjectData item=controller.myProjectList[index];
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
                         contentPadding:EdgeInsets.zero,
                          leading: CommonWidgets.imageView(
                              image:item.userData!.image??'',
                              width: 40.px,height: 40.px,fit: BoxFit.fill,
                              borderRadius: BorderRadius.circular(20.px),
                            defaultNetworkImage: StringConstants.defaultUserImage
                          ),
                          title: Text('${item.userData!.firstName} ${item.userData!.lastName}',style: MyTextStyle.titleStyle16bb,),
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
        if(controller.myProjectList.isEmpty)
          CommonWidgets.dataNotFound()
      ],
    );
  }
}
