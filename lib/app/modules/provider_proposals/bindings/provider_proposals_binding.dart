import 'package:get/get.dart';

import '../controllers/provider_proposals_controller.dart';

class ProviderProposalsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderProposalsController>(
      () => ProviderProposalsController(),
    );
  }
}
