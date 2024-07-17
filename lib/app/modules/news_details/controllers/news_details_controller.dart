import 'package:get/get.dart';

import '../../../data/apis/api_models/get_news_model.dart';

class NewsDetailsController extends GetxController {
  NewsResult newsResult=Get.arguments;

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
