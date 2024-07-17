import 'package:get/get.dart';

import '../controllers/project_detail_proposal_controller.dart';

class ProjectDetailProposalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProjectDetailProposalController>(
      () => ProjectDetailProposalController(),
    );
  }
}
