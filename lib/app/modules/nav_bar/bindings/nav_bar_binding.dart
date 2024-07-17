import 'package:get/get.dart';
import 'package:mp_online/app/modules/add_project/controllers/add_project_controller.dart';
import 'package:mp_online/app/modules/home/controllers/home_controller.dart';
import 'package:mp_online/app/modules/jobs/controllers/jobs_controller.dart';
import 'package:mp_online/app/modules/news/controllers/news_controller.dart';
import 'package:mp_online/app/modules/profile/controllers/profile_controller.dart';
import 'package:mp_online/app/modules/providers/controllers/providers_controller.dart';

import '../controllers/nav_bar_controller.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<NavBarController>(
      () => NavBarController(),
    );

    Get.lazyPut<ProvidersController>(
          () => ProvidersController(),
    );
    Get.lazyPut<JobsController>(
          () => JobsController(),
    );

    Get.lazyPut<AddProjectController>(
          () => AddProjectController(),
    );
    Get.lazyPut<NewsController>(
          () => NewsController(),
    );


    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
  }
}
