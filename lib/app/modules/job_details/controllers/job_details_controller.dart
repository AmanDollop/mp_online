import 'package:get/get.dart';

import '../../../data/apis/api_models/get_job_vacancy.dart';

class JobDetailsController extends GetxController {
  JobVacancyResult jobVacancyResult=Get.arguments;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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
}
