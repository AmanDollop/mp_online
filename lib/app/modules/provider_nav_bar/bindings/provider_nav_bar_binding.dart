import 'package:get/get.dart';
import 'package:mp_online/app/modules/jobs/controllers/jobs_controller.dart';

import '../../home/controllers/home_controller.dart';
import '../../news/controllers/news_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/provider_nav_bar_controller.dart';

class ProviderNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderNavBarController>(
      () => ProviderNavBarController(),
    );
    Get.lazyPut<HomeController>(
          () => HomeController(),
    );

    Get.lazyPut<JobsController>(
          () => JobsController(),
    );
    Get.lazyPut<NewsController>(
          () => NewsController(),
    );


    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
  }
}
