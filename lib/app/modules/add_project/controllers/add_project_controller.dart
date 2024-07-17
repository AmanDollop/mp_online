import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mp_online/app/data/apis/api_models/get_category_model.dart';
import 'package:mp_online/app/data/apis/api_models/get_simple_respose_model.dart';
import 'package:mp_online/common/local_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/alert_dialog_view.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_user_model.dart';
import '../../../data/constants/string_constants.dart';

class AddProjectController extends GetxController {
  TextEditingController serviceNameController=TextEditingController();
  TextEditingController categoryIdController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController timeController=TextEditingController();
  TextEditingController copyTypeController=TextEditingController();
  TextEditingController budgetController=TextEditingController();
  TextEditingController studentNameController=TextEditingController();
  TextEditingController studentCurrentGradeController=TextEditingController();
  TextEditingController genderController=TextEditingController();
  TextEditingController languageController=TextEditingController();
  TextEditingController subjectForAllSpecificController=TextEditingController();
  TextEditingController studentAvailableClassTimeController=TextEditingController();
  TextEditingController addressStudentController=TextEditingController();
  TextEditingController studentSchoolNameController=TextEditingController();
  TextEditingController educationalTypeController=TextEditingController();
  TextEditingController numberOfStudentToturController=TextEditingController();
  TextEditingController preferenceForMaleOrController=TextEditingController();
  TextEditingController teacherExperienceController=TextEditingController();
  TextEditingController teacherEnglishProficiencyController=TextEditingController();
  TextEditingController tutorExperienceController=TextEditingController();


  FocusNode focusServiceName = FocusNode();
  FocusNode focusCategoryId = FocusNode();
  FocusNode focusPhone = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusAddress = FocusNode();
  FocusNode focusDescription = FocusNode();
  FocusNode focusTime = FocusNode();
  FocusNode focusCopyType = FocusNode();
  FocusNode focusBudget = FocusNode();


  FocusNode focusStudentName = FocusNode();
  FocusNode focusStudentCurrentGrade = FocusNode();
  FocusNode focusGender = FocusNode();
  FocusNode focusLanguage = FocusNode();
  FocusNode focusSubjectForAllSpecific = FocusNode();
  FocusNode focusStudentAvailableClassTime = FocusNode();
  FocusNode focusAddressStudent = FocusNode();
  FocusNode focusStudentSchoolName = FocusNode();
  FocusNode focusEducationalType = FocusNode();
  FocusNode focusNumberOfStudentTotur = FocusNode();
  FocusNode focusPreferenceForMaleOr = FocusNode();
  FocusNode focusTeacherExperience = FocusNode();
  FocusNode focusTeacherEnglishProficiency = FocusNode();
  FocusNode focusTutorExperience = FocusNode();

  final isServiceName = false.obs;
  final isCategoryId= false.obs;
  final isDescription = false.obs;
  final isTime = false.obs;
  final isCopyType = false.obs;
  final isBudget = false.obs;
  final isPhone = false.obs;
  final isEmail = false.obs;
  final isAddress = false.obs;

  final isStudentName = false.obs;
  final isStudentCurrentGrade= false.obs;
  final isGender = false.obs;
  final isLanguage = false.obs;
  final isSubjectForAllSpecific = false.obs;
  final isStudentAvailableClassTime = false.obs;
  final isAddressStudent = false.obs;
  final isStudentSchoolName = false.obs;
  final isEducationalType = false.obs;
  final isNumberOfStudentTotur = false.obs;
  final isPreferenceForMaleOr= false.obs;
  final isTeacherExperience = false.obs;
  final isTeacherEnglishProficiency = false.obs;
  final isTutorExperience = false.obs;

  final hide = true.obs;
  final checked = false.obs;
  final isLoading = false.obs;
  final categorySelectedId = ''.obs;
  List<GetCategoryResult> categoryList=[];
  final documentImage = Rxn<File>();
  Map<String, File> imageMap = {};
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getCategory();
    startListener();
    phoneController.text=Get.find<LocalUserData>().userPhone.value;
    emailController.text=Get.find<LocalUserData>().userEmail.value;
    addressController.text=Get.find<LocalUserData>().userAddress.value;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void startListener() {
    focusServiceName.addListener(onFocusChange);
    focusCategoryId.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusAddress.addListener(onFocusChange);
    focusDescription.addListener(onFocusChange);
    focusTime.addListener(onFocusChange);
    focusCopyType.addListener(onFocusChange);
    focusBudget.addListener(onFocusChange);
    focusStudentName.addListener(onFocusChange);
    focusStudentCurrentGrade.addListener(onFocusChange);
    focusGender.addListener(onFocusChange);
    focusLanguage.addListener(onFocusChange);
    focusSubjectForAllSpecific.addListener(onFocusChange);
    focusStudentAvailableClassTime.addListener(onFocusChange);
    focusAddressStudent.addListener(onFocusChange);
    focusStudentSchoolName.addListener(onFocusChange);
    focusEducationalType.addListener(onFocusChange);
    focusNumberOfStudentTotur.addListener(onFocusChange);
    focusPreferenceForMaleOr.addListener(onFocusChange);
    focusTeacherExperience.addListener(onFocusChange);
    focusTeacherEnglishProficiency.addListener(onFocusChange);
    focusTutorExperience.addListener(onFocusChange);
  }

  void onFocusChange() {
    isServiceName.value = focusServiceName.hasFocus;
    isCategoryId.value = focusCategoryId.hasFocus;
    isPhone.value = focusPhone.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isAddress.value = focusAddress.hasFocus;
    isDescription.value = focusDescription.hasFocus;
    isBudget.value = focusBudget.hasFocus;
    isTime.value = focusTime.hasFocus;
    isCopyType.value = focusCopyType.hasFocus;
    isStudentName.value = focusStudentName.hasFocus;
    isStudentCurrentGrade.value = focusStudentCurrentGrade.hasFocus;
    isGender.value = focusGender.hasFocus;
    isLanguage.value = focusLanguage.hasFocus;
    isSubjectForAllSpecific.value = focusSubjectForAllSpecific.hasFocus;
    isStudentAvailableClassTime.value = focusStudentAvailableClassTime.hasFocus;
    isAddressStudent.value = focusAddressStudent.hasFocus;
    isStudentSchoolName.value = focusStudentSchoolName.hasFocus;
    isEducationalType.value = focusEducationalType.hasFocus;
    isNumberOfStudentTotur.value = focusNumberOfStudentTotur.hasFocus;
    isPreferenceForMaleOr.value = focusPreferenceForMaleOr.hasFocus;
    isTeacherExperience.value = focusTeacherExperience.hasFocus;
    isTeacherEnglishProficiency.value = focusTeacherEnglishProficiency.hasFocus;
    isTutorExperience.value = focusTutorExperience.hasFocus;
  }

  void increment() => count.value++;


  void showAlertDialog() {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MyAlertDialog(
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: cameraTextButtonView(),
              onPressed: () => clickCameraTextButtonView(),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: galleryTextButtonView(),
              onPressed: () => clickGalleryTextButtonView(),
            ),
          ],
          title: selectImageTextView(),
          content: contentTextView(),
        );
      },
    );
  }

  Widget selectImageTextView() => Text(
    StringConstants.selectImage,
    style: MyTextStyle.titleStyle18bb,
  );

  Widget contentTextView() => Text(
    StringConstants.chooseImageFromTheOptionsBelow,
    style:MyTextStyle.titleStyle14bb,
  );

  Widget cameraTextButtonView() => Text(
    StringConstants.camera,
    style: MyTextStyle.titleStyle10bb,
  );

  Widget galleryTextButtonView() => Text(
    StringConstants.gallery,
    style:MyTextStyle.titleStyle10bb,
  );

  Future<void> clickCameraTextButtonView() async {
    pickCamera();
    Get.back();
  }

  Future<void> clickGalleryTextButtonView() async {
    pickGallery();
    Get.back();
  }

  Future<void> pickCamera() async {
    documentImage.value = await ImagePickerAndCropper.pickImage(
      context: Get.context!,
      wantCropper: true,
      color: Theme.of(Get.context!).primaryColor,
    );
    increment();
  }

  Future<void> pickGallery() async {
      documentImage.value = await ImagePickerAndCropper.pickImage(
          context: Get.context!,
          wantCropper: true,
          color: Theme.of(Get.context!).primaryColor,
          pickImageFromGallery: true);
       increment();
  }

  clickOnPublishButton() async {

    if (documentImage.value != null && serviceNameController.text.isNotEmpty  && phoneController.text.isNotEmpty  && emailController.text.isNotEmpty
        &&  addressController.text.isNotEmpty  && budgetController.text.isNotEmpty&& copyTypeController.text.isNotEmpty
        && timeController.value!=null  && descriptionController.value!=null) {
      imageMap = {
        'image[]': documentImage.value ?? File('')
      };
      Map<String,String> bodyParams = {
        ApiKeyConstants.userId:Get.find<LocalUserData>().userId.value,
        ApiKeyConstants.serviceName:serviceNameController.text.toString(),
        ApiKeyConstants.phone:phoneController.text.toString(),
        ApiKeyConstants.address:addressController.text.toString(),
        ApiKeyConstants.email:emailController.text.toString(),
        ApiKeyConstants.description:descriptionController.text.toString(),
        ApiKeyConstants.time:timeController.text.toString(),
        ApiKeyConstants.budgetAmount:budgetController.text.toString(),
        ApiKeyConstants.selectCopy:copyTypeController.text.toString(),
        ApiKeyConstants.categoryId:categorySelectedId.value.toString(),
      };
      isLoading.value = true;
      SimpleResponseModel? simpleResponseModel =
      await ApiMethods.addProjectApi(
          bodyParams: bodyParams, imageMap: imageMap);
      if (simpleResponseModel != null && simpleResponseModel.status=='1') {
        CommonWidgets.showToastMessage(simpleResponseModel.message??'');
        documentImage.value=null;
        serviceNameController.text='';
        budgetController.text='';
        timeController.text='';
        descriptionController.text='';
      }else{
        CommonWidgets.showToastMessage(simpleResponseModel!.message??'');
      }
    } else {
      CommonWidgets.showToastMessage('All Fields Required');
    }
    isLoading.value = false;
  }


  clickOnPublishButtonAddTutorEnquiry() async {

    if (
        studentNameController.text.isNotEmpty  &&
        studentCurrentGradeController.text.isNotEmpty  &&
        genderController.text.isNotEmpty &&
        languageController.text.isNotEmpty  &&
        subjectForAllSpecificController.text.isNotEmpty &&
        studentAvailableClassTimeController.text.isNotEmpty &&
        addressStudentController.text.isNotEmpty  &&
        studentSchoolNameController.text.isNotEmpty  &&
        educationalTypeController.text.isNotEmpty &&
        numberOfStudentToturController.text.isNotEmpty  &&
        preferenceForMaleOrController.text.isNotEmpty &&
        teacherExperienceController.text.isNotEmpty &&
        teacherEnglishProficiencyController.text.isNotEmpty  &&
        tutorExperienceController.text.isNotEmpty) {
      Map<String,String> bodyParams = {
        ApiKeyConstants.userId : Get.find<LocalUserData>().userId.value,
        ApiKeyConstants.studentName : studentNameController.text.toString(),
        ApiKeyConstants.studentCurrentGrade : studentCurrentGradeController.text.toString(),
        ApiKeyConstants.gender : genderController.text.toString(),
        ApiKeyConstants.language : languageController.text.toString(),
        ApiKeyConstants.subjectForAllSpecific : subjectForAllSpecificController.text.toString(),
        ApiKeyConstants.studentAvailableClassTime : studentAvailableClassTimeController.text.toString(),
        ApiKeyConstants.address : addressStudentController.text.toString(),
        ApiKeyConstants.studentSchoolName : studentSchoolNameController.text.toString(),
        ApiKeyConstants.educationalType : educationalTypeController.text.toString(),
        ApiKeyConstants.numberOfStudentTotur : numberOfStudentToturController.text.toString(),
        ApiKeyConstants.preferenceForMaleOr : preferenceForMaleOrController.text.toString(),
        ApiKeyConstants.teacherExperience : teacherExperienceController.text.toString(),
        ApiKeyConstants.teacherEnglishProficiency : teacherEnglishProficiencyController.text.toString(),
        ApiKeyConstants.tutorExperience : tutorExperienceController.text.toString(),
      };
      isLoading.value = true;
      SimpleResponseModel? simpleResponseModel =
      await ApiMethods.addTutarEnquiryApi(
          bodyParams: bodyParams/*, imageMap: imageMap*/);
      if (simpleResponseModel != null && simpleResponseModel.status=='1') {
        CommonWidgets.showToastMessage(simpleResponseModel.message??'');
        studentNameController.text = '';
        studentCurrentGradeController.text = '';
        genderController.text = '';
        languageController.text = '';
        subjectForAllSpecificController.text = '';
        studentAvailableClassTimeController.text = '';
        addressStudentController.text = '';
        studentSchoolNameController.text = '';
        educationalTypeController.text = '';
        numberOfStudentToturController.text = '';
        preferenceForMaleOrController.text = '';
        teacherExperienceController.text = '';
        teacherEnglishProficiencyController.text = '';
        tutorExperienceController.text = '';
      }else{
        CommonWidgets.showToastMessage(simpleResponseModel!.message??'');
      }
    } else {
      CommonWidgets.showToastMessage('All Fields Required');
    }
    isLoading.value = false;
  }


  getCategory() async {
    try {
      GetCategoryModel? getCategoryModel =
      await ApiMethods.getCategoryApi();
      if (getCategoryModel != null && getCategoryModel.status == '1'&&getCategoryModel.result!.isNotEmpty) {
        categoryList=getCategoryModel.result!;
        categorySelectedId.value=categoryList[0].categoryId??'';
        categoryIdController.text=categoryList[0].categoryName??'';
      }
    }catch(e){
      print('Error:-${e.toString()}');
    }
    increment();
  }
}
