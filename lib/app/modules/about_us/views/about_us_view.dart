import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/about_us_controller.dart';

class AboutUsView extends GetView<AboutUsController> {
  const AboutUsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx((){
      controller.count.value;
      return Scaffold(
          appBar:CommonWidgets.appBarView(title: StringConstants.aboutUs),
          body: CommonWidgets.progressBar(
            isLoading: controller.isLoading.value,
            width: double.infinity,
            height: double.infinity,
            child:WebViewWidget(controller: controller.webViewController),

          )
      );
    });
  }
}
