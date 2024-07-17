import 'package:get/get.dart';

import '../../../data/constants/string_constants.dart';

class FaqController extends GetxController {

  final count = 0.obs;
  List<bool> statusList=[false,false,false,false,false];
  List<String> questionList=[
    'What services do you offer?',
    'How can I get a quote for your services?',
    'What industries do you cater to?',
    'How can I contact your customer support?',
    'What is your refund policy?'
  ];
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

  changeStatus(int index){
    statusList[index]=!statusList[index];
    increment();
  }
}
