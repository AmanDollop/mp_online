import 'package:get/get.dart';
import 'package:mp_online/app/data/apis/api_models/get_job_vacancy.dart';
import 'package:mp_online/app/routes/app_pages.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class JobsController extends GetxController {
  List<JobVacancyResult> jobList=[];
  final isLoading = true.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getAllNews();
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

  clickOnJobDetailButton(int index){
    Get.toNamed(Routes.JOB_DETAILS,arguments: jobList[index]);
  }

  getAllNews() async {
    try {
      JobVacancyModel? jobVacancyModel =
      await ApiMethods.getAllJobVacancyApi();
      if (jobVacancyModel != null && jobVacancyModel.status == '1') {
        jobList=jobVacancyModel.result!;
      }else{
        CommonWidgets.showToastMessage(jobVacancyModel!.message ?? '');
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      print('Error:-${e.toString()}');
    }
  }

  clickOnSearchBar(){
    Get.toNamed(Routes.SEARCH_JOB);
  }
}
