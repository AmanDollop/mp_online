import 'package:get/get.dart';
import 'package:mp_online/app/data/apis/api_models/get_my_project_model.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_user_model.dart';
import '../../../routes/app_pages.dart';

class MyAccountController extends GetxController {
  //TODO: Implement MyAccountController
  Map<String,String?> parameters=Get.parameters;
  final count = 0.obs;
  final isLoading = true.obs;
  List<GetMyProjectData> myProjectList=[];
  @override
  void onInit() {
    super.onInit();
    getMyProjects();
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
    Get.toNamed(Routes.PROJECT_DETAIL_PROPOSAL,arguments: myProjectList[index]);
  }

  getMyProjects() async {
    try {
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? '',
      };
      GetMyProjectModel? getMyProjectModel =
      await ApiMethods.getMyProjectApi(
          bodyParams: bodyParams);
      if (getMyProjectModel != null && getMyProjectModel.status == '1') {
        myProjectList=getMyProjectModel.data!;
      }else{
        CommonWidgets.showToastMessage(getMyProjectModel!.message ?? '');
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      print('Error:-${e.toString()}');
    }
  }

}
