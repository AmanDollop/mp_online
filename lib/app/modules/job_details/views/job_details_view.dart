import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/job_details_controller.dart';

class JobDetailsView extends GetView<JobDetailsController> {
  const JobDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: StringConstants.jobs),
      body:Obx(() {
        controller.count.value;
        return Padding(
          padding:  EdgeInsets.only(left:15.px,right:15.px,top: 15.px),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,width: 100.px,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.px),
                    border: Border.all(color: primaryColor,width: 1.px)
                  ),
                  child: const Icon(Icons.home_work,size: 90,color: Colors.grey,),
                ),
                SizedBox(height: 5.px,),
                Text(controller.jobVacancyResult.companyName??'',style: MyTextStyle.titleStyle18bb,),
                SizedBox(height: 5.px,),
                Text(controller.jobVacancyResult.workField??'',style: MyTextStyle.titleStyle16bb,),
                SizedBox(height: 20.px,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on,size: 20.px,color:primaryColor,),
                    SizedBox(width: 5.px,),
                    Text(controller.jobVacancyResult.address??'Remote',style: MyTextStyle.titleStyle12b,),
                  ],
                ),
                SizedBox(height: 10.px,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.work,size: 20.px,color:primaryColor,),
                        SizedBox(width: 5.px,),
                        Text('Full Time',style: MyTextStyle.titleStyle12b,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.currency_rupee,size: 20.px,color:primaryColor,),
                        SizedBox(width: 5.px,),
                        Text(controller.jobVacancyResult.packageAmount??'3-4 LPA',style: MyTextStyle.titleStyle12b,),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5.px,),
                Divider(thickness: 1.px,indent: 2.px,endIndent: 2.px,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Job Sector:',style: MyTextStyle.titleStyle16bb,),
                    SizedBox(width: 5.px,),
                    Text(controller.jobVacancyResult.jobSector??'',style: MyTextStyle.titleStyle12b,),
                  ],
                ),

                SizedBox(height: 5.px,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('No of vacancy:',style: MyTextStyle.titleStyle16bb,),
                    SizedBox(width: 5.px,),
                    Text('Hiring ${controller.jobVacancyResult.noOfVacancy} candidates',style: MyTextStyle.titleStyle12b,),
                  ],
                ),
                SizedBox(height: 5.px,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Experience:',style: MyTextStyle.titleStyle16bb,),
                    SizedBox(width: 5.px,),
                    Text(controller.jobVacancyResult.experience??'2-3 Years',style: MyTextStyle.titleStyle12b,),
                  ],
                ),
                SizedBox(height: 5.px,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Industry of Employee:',style: MyTextStyle.titleStyle16bb,),
                    SizedBox(width: 5.px,),
                    Text(controller.jobVacancyResult.industryOfEmployer??'IT Sector',style: MyTextStyle.titleStyle12b,),
                  ],
                ),
                SizedBox(height: 5.px,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Skills:',style: MyTextStyle.titleStyle16bb,),
                    SizedBox(width: 5.px,),
                    Text(controller.jobVacancyResult.skills??'',style: MyTextStyle.titleStyle12b,),
                  ],
                ),
                SizedBox(height: 5.px,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Education:',style: MyTextStyle.titleStyle16bb,),
                    SizedBox(width: 5.px,),
                    Text(controller.jobVacancyResult.education??'',style: MyTextStyle.titleStyle12b,),
                  ],
                ),
                SizedBox(height: 5.px,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Salary:',style: MyTextStyle.titleStyle16bb,),
                    SizedBox(width: 5.px,),
                    Text(controller.jobVacancyResult.salary??'',style: MyTextStyle.titleStyle12b,),
                  ],
                ),
                SizedBox(height: 5.px,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Start Date:',style: MyTextStyle.titleStyle16bb,),
                    SizedBox(width: 5.px,),
                    Text(controller.jobVacancyResult.startDate??'',style: MyTextStyle.titleStyle12b,),
                  ],
                ),
                SizedBox(height: 5.px,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('End Date:',style: MyTextStyle.titleStyle16bb,),
                    SizedBox(width: 5.px,),
                    Text(controller.jobVacancyResult.endDate??'',style: MyTextStyle.titleStyle12b,),
                  ],
                ),
                SizedBox(height: 5.px,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Company Website:',style: MyTextStyle.titleStyle16bb,),
                    SizedBox(width: 5.px,),
                    Text(controller.jobVacancyResult.companyWebsite??'',style: MyTextStyle.titleStyle12b,),
                  ],
                ),
                SizedBox(height: 5.px,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Description:',style: MyTextStyle.titleStyle16bb,),
                    SizedBox(width: 5.px,),
                    Text(controller.jobVacancyResult.description??'',style: MyTextStyle.titleStyle12b,),
                  ],
                ),
                SizedBox(height: 15.px,),
                CommonWidgets.commonElevatedButton(
                    onPressed: (){
                      //controller.clickOnJobDetailButton(index);
                    },
                    child: Text(StringConstants.apply,style:MyTextStyle.titleStyle16bw,),
                    borderRadius: 10.px
                ),
                SizedBox(height: 50.px,),
              ],
            ),
          ),
        );
      })
    );
  }
}
