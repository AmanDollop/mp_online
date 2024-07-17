import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/apis/api_models/get_my_submited_proposal_model.dart';

class ProposalDetailsController extends GetxController {
  Map<String,String?> parameters=Get.parameters;
  final count = 0.obs;
  GetMySubmittedProposalData getMySubmittedProposalData=Get.arguments;
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
