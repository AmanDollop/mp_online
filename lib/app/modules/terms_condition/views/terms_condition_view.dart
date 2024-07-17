import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mp_online/app/data/constants/string_constants.dart';
import 'package:mp_online/common/common_widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/terms_condition_controller.dart';

class TermsConditionView extends GetView<TermsConditionController> {
  const TermsConditionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx((){
      controller.count.value;
      return Scaffold(
          appBar:CommonWidgets.appBarView(title: StringConstants.termAndConditions),
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
