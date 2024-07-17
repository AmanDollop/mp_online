import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_job_vacancy.dart';
import '../../../routes/app_pages.dart';

class SearchJobController extends GetxController {
  TextEditingController searchController=TextEditingController();
  List<JobVacancyResult> jobList=[];
  List<JobVacancyResult> filterJobList=[];
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

  filterUsersList(String query){
    filterJobList = jobList
        .where((result) => result.workField!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    update();

  }

  getAllNews() async {
    try {
      JobVacancyModel? jobVacancyModel =
      await ApiMethods.getAllJobVacancyApi();
      if (jobVacancyModel != null && jobVacancyModel.status == '1') {
        jobList=jobVacancyModel.result!;
        filterJobList=jobVacancyModel.result!;
      }else{
        CommonWidgets.showToastMessage(jobVacancyModel!.message ?? '');
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      print('Error:-${e.toString()}');
    }
  }

}
