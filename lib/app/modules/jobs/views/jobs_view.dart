import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_models/get_job_vacancy.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/jobs_controller.dart';

class JobsView extends GetView<JobsController> {
  const JobsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: InkWell(
            onTap: (){
              controller.clickOnSearchBar();
            },
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
        ),
        centerTitle: true,
      ),
      body:Obx(() {
        controller.count.value;
        return  SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: showAllJobVacancy()
        );
      })
    );
  }


  Widget showAllJobVacancy(){
    return   controller.isLoading.value?
    CommonWidgets.commonShimmer(
      height: 330.px,
      itemCount: 4,
      shimmerWidget:  Container(
        height: 270.px,
        padding:  EdgeInsets.all(10.px),
        margin:  EdgeInsets.all(10.px),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.px),
              border: Border.all(color: Colors.black,width: 1.px)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0.px,vertical: 0.px),
              trailing: Icon(Icons.save,size: 30.px,
                color:primaryColor,
              ),
              title:Container(
                height: 15.px,
                decoration:BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(3.px)
                ) ,
              ),
              subtitle:Container(
                height: 15.px,
                decoration:BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(3.px)
                ) ,
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120.px,
                  height: 15.px,
                  decoration:BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3.px)
                  ) ,
                ),
                Container(
                  width: 120.px,
                  height: 15.px,
                  decoration:BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3.px)
                  ) ,
                )
              ],
            ),
            SizedBox(height: 5.px,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on,size: 20.px,color:primaryColor,),
                SizedBox(width: 5.px,),
                Container(
                  width: 250.px,
                  height: 15.px,
                  decoration:BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3.px)
                  ) ,
                )
              ],
            ),
            SizedBox(height: 5.px,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.work,size: 20.px,color:primaryColor,),
                SizedBox(width: 5.px,),
                Container(
                  width: 50.px,
                  height: 15.px,
                  decoration:BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3.px)
                  ) ,
                )
              ],
            ),
            SizedBox(height: 5.px,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.person_add_alt_rounded,size: 20.px,color:primaryColor,),
                SizedBox(width: 5.px,),
                Container(
                  width: 70.px,
                  height: 15.px,
                  decoration:BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3.px)
                  ) ,
                )
              ],
            ),
            SizedBox(height: 5.px,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.access_time,size: 20.px,color:primaryColor,),
                SizedBox(width: 5.px,),
                Container(
                  width: 60.px,
                  height: 15.px,
                  decoration:BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(3.px)
                  ) ,
                )
              ],
            ),
            SizedBox(height: 5.px,),
            CommonWidgets.commonElevatedButton(
                onPressed: (){

                },
                child: Text(StringConstants.moreDetails,style:MyTextStyle.titleStyle16bw,),
                borderRadius: 10.px
            )
          ],
        ),
      ),
    ): ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount:controller.jobList.length,
        itemBuilder: (context, index){
          JobVacancyResult item=controller.jobList[index];
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
                height: 270.px,
                padding:  EdgeInsets.all(10.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0.px,vertical: 0.px),
                      trailing: Icon(Icons.save,size: 30.px,
                          color:primaryColor,
                      ),
                      title: Text(item.workField??'',style: MyTextStyle.titleStyle16bb,),
                      subtitle: Text(item.companyName??'',style: MyTextStyle.titleStyle12b,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(item.packageAmount??'3-4 LPA',style: MyTextStyle.titleStyle16bb,),
                        Text(item.experience??'Exp:1-2 Year',style: MyTextStyle.titleStyle16bb,),
                      ],
                    ),
                    SizedBox(height: 5.px,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on,size: 20.px,color:primaryColor,),
                        SizedBox(width: 5.px,),
                        Text(item.address??'Remote',style: MyTextStyle.titleStyle12b,),
                      ],
                    ),
                    SizedBox(height: 5.px,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.work,size: 20.px,color:primaryColor,),
                        SizedBox(width: 5.px,),
                        Text('Full Time',style: MyTextStyle.titleStyle12b,),
                      ],
                    ),
                    SizedBox(height: 5.px,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.person_add_alt_rounded,size: 20.px,color:primaryColor,),
                        SizedBox(width: 5.px,),
                        Text('Hiring ${item.noOfVacancy} candidates',style: MyTextStyle.titleStyle12b,),
                      ],
                    ),
                    SizedBox(height: 5.px,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.access_time,size: 20.px,color:primaryColor,),
                        SizedBox(width: 5.px,),
                        Text(item.endDate??'5 day ago',style: MyTextStyle.titleStyle12b,),
                      ],
                    ),
                    SizedBox(height: 5.px,),
                    CommonWidgets.commonElevatedButton(
                        onPressed: (){
                          controller.clickOnJobDetailButton(index);
                        },
                        child: Text(StringConstants.moreDetails,style:MyTextStyle.titleStyle16bw,),
                        borderRadius: 10.px
                    )
                  ],
                ),
              ),
            );
        });
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
        r"<[^>]*>",
        multiLine: true,
        caseSensitive: true
    );

    return htmlText.replaceAll(exp, '');
  }
}
