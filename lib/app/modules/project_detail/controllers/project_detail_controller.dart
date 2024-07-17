import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mp_online/app/data/apis/api_models/get_simple_respose_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/local_data.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_my_project_model.dart';

class ProjectDetailController extends GetxController {
  TextEditingController timeController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController budgetController=TextEditingController();

  FocusNode focusTime = FocusNode();
  FocusNode focusDescription = FocusNode();
  FocusNode focusBudget = FocusNode();

  final isTime = false.obs;
  final isBudget = false.obs;
  final isDescription = false.obs;
  final isLoading = false.obs;
  GetMyProjectData getMyProjectData=Get.arguments;

  final count = 0.obs;
  final tabIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    startListener();
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
    focusDescription.addListener(onFocusChange);
    focusTime.addListener(onFocusChange);
    focusBudget.addListener(onFocusChange);
  }

  void onFocusChange() {
    isDescription.value = focusDescription.hasFocus;
    isBudget.value = focusBudget.hasFocus;
    isTime.value = focusTime.hasFocus;
  }


  void increment() => count.value++;

  clickOnTab(int index){
    tabIndex.value=index;
    increment();
  }

  downloadFile(String url) async{
    if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
    }
  }

  clickOnSendRequestButton() async {
    if ( budgetController.text.isNotEmpty && timeController.text.isNotEmpty && descriptionController.text.isNotEmpty) {
      try {
        Map<String, String> bodyParams = {
          ApiKeyConstants.userId: Get.find<LocalUserData>().userId.value,
          ApiKeyConstants.projectId:getMyProjectData.id??'',
          ApiKeyConstants.budgetAmount: budgetController.text.toString(),
          ApiKeyConstants.time: timeController.text.toString(),
          ApiKeyConstants.description: descriptionController.text.toString()
        };

        isLoading.value = true;
        SimpleResponseModel? sendOtpModel =
        await ApiMethods.sendProposalRequestApi(
            bodyParams: bodyParams);
        if (sendOtpModel != null && sendOtpModel.status == '1') {
          CommonWidgets.showToastMessage(sendOtpModel.message ?? '');
        } else {
          CommonWidgets.showToastMessage(sendOtpModel!.message ?? '');
        }
      }catch(e){
        print('Error :-${e.toString()}');
        CommonWidgets.showToastMessage('There are some issue please try after some time...');
      }

    } else {
      CommonWidgets.showToastMessage('Please enter all fields..');
    }
    isLoading.value = false;
  }
}
