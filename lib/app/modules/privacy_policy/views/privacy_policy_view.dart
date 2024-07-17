import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mp_online/common/common_widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../data/constants/string_constants.dart';
import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx((){
      controller.count.value;
      return Scaffold(
          appBar:CommonWidgets.appBarView(title: StringConstants.privacyPolicy),
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