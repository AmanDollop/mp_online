import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_models/get_category_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/add_project_controller.dart';

class AddProjectView extends GetView<AddProjectController> {
  const AddProjectView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
          appBar: AppBar(
            leading: const SizedBox(),
            title: Text(StringConstants.forms, style: Theme.of(Get.context!)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 20.px),),
            bottom: const TabBar(
              tabs: [
                Tab( text: StringConstants.addProject,),
                Tab( text: StringConstants.addTutarEnquiry),
              ],
            ),
          ),
         // appBar: CommonWidgets.appBarView(title:StringConstants.addProject,showBackIcon: false),
          resizeToAvoidBottomInset: false,
          body:TabBarView(
            children: [
              Obx((){
                controller.count.value;
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20.px),
                        child: Column(
                          children: [
                            SizedBox(height: 10.px,),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusServiceName,
                              title: StringConstants.serviceName,
                              controller: controller.serviceNameController,
                              hintText: StringConstants.serviceName,
                              keyboardType: TextInputType.name,
                              isCard: controller.isServiceName.value,

                            ),
                            if(controller.categoryList.isNotEmpty)
                              Column(
                                children: [
                                  SizedBox(height: 10.px,),
                                  CommonWidgets.commonTextFieldForLoginSignUP(
                                      focusNode: controller.focusCategoryId,
                                      title: StringConstants.selectServiceCategory,
                                      controller: controller.categoryIdController,
                                      hintText: StringConstants.selectServiceCategory,
                                      readOnly: true,
                                      isCard: controller.isCategoryId.value,
                                      suffixIcon:Icon(Icons.keyboard_arrow_down,size: 30.px,color: Colors.grey,),
                                      onTap: (){
                                        clickOnCategoryIdTextField();
                                      }

                                  ),
                                ],
                              ),
                            SizedBox(height: 10.px,),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                                focusNode: controller.focusPhone,
                                title: StringConstants.phoneNo,
                                controller: controller.phoneController,
                                hintText: StringConstants.enterYourMobileNumber,
                                keyboardType: TextInputType.phone,
                                isCard: controller.isPhone.value,
                                prefixIcon: Text('+ 91',style: MyTextStyle.titleStyle16bb,)

                            ),
                            SizedBox(height: 10.px,),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusEmail,
                              title: StringConstants.email,
                              controller: controller.emailController,
                              hintText: StringConstants.enterYourEmailId,
                              keyboardType: TextInputType.emailAddress,
                              isCard: controller.isEmail.value,

                            ),
                            SizedBox(height: 10.px,),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusAddress,
                              title: StringConstants.address,
                              controller: controller.addressController,
                              hintText: StringConstants.enterAddress,
                              keyboardType: TextInputType.name,
                              isCard: controller.isAddress.value,

                            ),
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
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusCopyType,
                              title: StringConstants.selectCopyType,
                              controller: controller.copyTypeController,
                              hintText: StringConstants.hard,
                              keyboardType: TextInputType.name,
                              isCard: controller.isCopyType.value,
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
                                maxLines: 5,
                                focusNode: controller.focusDescription,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 5.px,vertical: 3.px),
                                    hintText: StringConstants.description,
                                    hintStyle: MyTextStyle.titleStyle14b
                                ),
                              ),
                            ),
                            SizedBox(height: 20.px,),
                            GestureDetector(
                              onTap: (){
                                controller.showAlertDialog();
                              },
                              child: Container(
                                height: 140.px,
                                width: double.infinity,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1.px,color: Colors.black54),
                                  borderRadius: BorderRadius.circular(8.px),
                                ),
                                child: Stack(
                                  children: [
                                    Obx(() => controller.documentImage.value == null
                                        ? const SizedBox()
                                        : ClipRRect(
                                      borderRadius: BorderRadius.circular(10.px),
                                      child: Image.file(
                                        height: 140.px,
                                        fit: BoxFit.fill,
                                        File(
                                          controller.documentImage.value!.path.toString(),
                                        ),
                                      ),
                                    )),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        CommonWidgets.appImagesView(
                                            imagePath:IconConstants.icGallery,
                                            width: 35.px,height: 35.px,
                                            fit: BoxFit.fill
                                        ),
                                        SizedBox(height: 5.px,),
                                        Text(StringConstants.documentImageOrPdf,style: MyTextStyle.titleStyle12b,)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(height: 20.px,),
                            CommonWidgets.commonElevatedButton(
                                onPressed: (){
                                  controller.clickOnPublishButton();
                                },
                                child:Text(StringConstants.publish,style: MyTextStyle.titleStyle20bw,),
                                borderRadius: 10.px,
                                isLoading: controller.isLoading.value
                            ),
                            SizedBox(height: 20.px,),

                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
              Obx((){
                controller.count.value;
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20.px),
                        child: Column(
                          children: [
                            SizedBox(height: 10.px,),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusStudentName,
                              title: StringConstants.studentName,
                              controller: controller.studentNameController,
                              hintText: StringConstants.studentName,
                              isCard: controller.isStudentName.value,
                            ),SizedBox(height: 10.px,),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusStudentCurrentGrade,
                              title: StringConstants.studentCurrentGrade,
                              controller: controller.studentCurrentGradeController,
                              hintText: StringConstants.studentCurrentGrade,
                              isCard: controller.isStudentCurrentGrade.value,
                            ),SizedBox(height: 10.px,),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusGender,
                              title: StringConstants.gender,
                              controller: controller.genderController,
                              hintText: StringConstants.gender,
                              isCard: controller.isGender.value,
                            ),SizedBox(height: 10.px,),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusLanguage,
                              title: StringConstants.language,
                              controller: controller.languageController,
                              hintText: StringConstants.language,
                              isCard: controller.isLanguage.value,
                            ),SizedBox(height: 10.px,),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusSubjectForAllSpecific,
                              title: StringConstants.subjectForAllSpecific,
                              controller: controller.subjectForAllSpecificController,
                              hintText: StringConstants.subjectForAllSpecific,
                              isCard: controller.isSubjectForAllSpecific.value,
                            ),SizedBox(height: 10.px,),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusStudentAvailableClassTime,
                              title: StringConstants.studentAvailableClassTime,
                              controller: controller.studentAvailableClassTimeController,
                              hintText: StringConstants.studentAvailableClassTime,
                              isCard: controller.isStudentAvailableClassTime.value,
                            ),SizedBox(height: 10.px,),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusAddressStudent,
                              title: StringConstants.addressStudent,
                              controller: controller.addressStudentController,
                              hintText: StringConstants.addressStudent,
                              isCard: controller.isAddressStudent.value,
                            ),SizedBox(height: 10.px,),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusStudentSchoolName,
                              title: StringConstants.studentSchoolName,
                              controller: controller.studentSchoolNameController,
                              hintText: StringConstants.studentSchoolName,
                              isCard: controller.isStudentSchoolName.value,
                            ),SizedBox(height: 10.px,),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusEducationalType,
                              title: StringConstants.educationalType,
                              controller: controller.educationalTypeController,
                              hintText: StringConstants.educationalType,
                              isCard: controller.isEducationalType.value,
                            ),SizedBox(height: 10.px,),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusNumberOfStudentTotur,
                              title: StringConstants.numberOfStudentTotur,
                              controller: controller.numberOfStudentToturController,
                              hintText: StringConstants.numberOfStudentTotur,
                              isCard: controller.isNumberOfStudentTotur.value,
                            ),SizedBox(height: 10.px,),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusPreferenceForMaleOr,
                              title: StringConstants.preferenceForMaleOr,
                              controller: controller.preferenceForMaleOrController,
                              hintText: StringConstants.preferenceForMaleOr,
                              isCard: controller.isPreferenceForMaleOr.value,
                            ),SizedBox(height: 10.px,),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusTeacherExperience,
                              title: StringConstants.teacherExperience,
                              controller: controller.teacherExperienceController,
                              hintText: StringConstants.teacherExperience,
                              isCard: controller.isTeacherExperience.value,

                            ),SizedBox(height: 10.px,),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusTeacherEnglishProficiency,
                              title: StringConstants.teacherEnglishProficiency,
                              controller: controller.teacherEnglishProficiencyController,
                              hintText: StringConstants.teacherEnglishProficiency,
                              isCard: controller.isTeacherEnglishProficiency.value,
                            ),SizedBox(height: 10.px,),
                            CommonWidgets.commonTextFieldForLoginSignUP(
                              focusNode: controller.focusTutorExperience,
                              title: StringConstants.tutorExperience,
                              controller: controller.tutorExperienceController,
                              hintText: StringConstants.tutorExperience,
                              isCard: controller.isTutorExperience.value,
                            ),
                            SizedBox(height: 20.px,),
                            CommonWidgets.commonElevatedButton(
                                onPressed: (){
                                  controller.clickOnPublishButtonAddTutorEnquiry();
                                },
                                child:Text(StringConstants.publish,style: MyTextStyle.titleStyle20bw,),
                                borderRadius: 10.px,
                                isLoading: controller.isLoading.value
                            ),
                            SizedBox(height: 20.px,),

                          ],
                        ),
                      )
                    ],
                  ),
                );
              })
            ],
          ),
      ),
    );
  }


  clickOnCategoryIdTextField() {
    return showModalBottomSheet(
        context: Get.context!,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(14.px),
            topLeft: Radius.circular(14.px),
          ),
        ),
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(height: 10.px,),
                  Text(StringConstants.selectServiceCategory,style: MyTextStyle.titleStyle16bb,),
                  SizedBox(height: 20.px,),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.categoryList.length,
                    itemBuilder: (context, index){
                      GetCategoryResult item=controller.categoryList[index];
                      return  Theme(
                        data: ThemeData(),
                        child: RadioListTile(
                          activeColor: Theme.of(context).primaryColor,
                          controlAffinity: ListTileControlAffinity.trailing,
                          selected: item.categoryId == controller.categorySelectedId.value,
                          groupValue: controller.categoryIdController.text,
                          value: item.categoryName,
                          onChanged: (value) async {
                            if (value != null) {
                              controller.categorySelectedId.value=item.categoryId??'';
                              controller.categoryIdController.text = item.categoryName??'';
                              controller.increment();
                              Get.back();
                            }
                          },
                          title: Text(item.categoryName??'',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 14.px),
                          ),
                        ),
                      );
                    }

                  ),
                ],
              ),
            );
          });
        });
  }
}
