import 'dart:convert';
import 'dart:ffi';

import 'package:get/get.dart';
import 'package:mp_online/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/local_data.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_methods/get_tutar_enquiry_model.dart';
import '../../../data/apis/api_models/get_my_project_model.dart';
import '../../../data/constants/string_constants.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  final isLoading = true.obs;
  List<GetMyProjectData> allProjectList=[];
  List<GetTutarEnquiryData> getTutarEnquiryData=[];
  final userType = ''.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    userType.value = sharedPreferences.getString(ApiKeyConstants.userType) ??'';
    print('userType.value    ${userType.value}');
    if(userType.value==StringConstants.provider) {
      getAllProjects();
    }else {
      getTutarEnquiryApi();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  clickOnMoreDetailButton(int index){
    Get.toNamed(Routes.PROJECT_DETAIL,arguments: allProjectList[index]);
  }

  clickOnMessageIcon(){
    Get.toNamed(Routes.MESSAGES);
  }

  getAllProjects() async {
    String myController=Get.find<LocalUserData>().userId.value;
    print("uSER_ID:$myController");
    try {
      GetMyProjectModel? getAllProjectModel =
      await ApiMethods.getAllProjectApi();
      if (getAllProjectModel != null && getAllProjectModel.status == '1') {
        allProjectList=getAllProjectModel.data!;
      }else{
        CommonWidgets.showToastMessage(getAllProjectModel!.message ?? '');
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      print('Error:-${e.toString()}');
    }
  }
  getTutarEnquiryApi() async {
    String myController=Get.find<LocalUserData>().userId.value;
    print("uSER_ID:$myController");
    Map<String,dynamic> bodyParams = {ApiKeyConstants.providerId:myController};
    try {
      GetTutarEnquiryModel? getTutarEnquiryModel =
      await ApiMethods.getTutarEnquiryApi(bodyParams: bodyParams);
      if (getTutarEnquiryModel != null && getTutarEnquiryModel.status == '1') {
        getTutarEnquiryData = getTutarEnquiryModel.data!;
      }else{
        CommonWidgets.showToastMessage(getTutarEnquiryModel!.message ?? '');
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      print('Error:-${e.toString()}');
    }
  }
}
