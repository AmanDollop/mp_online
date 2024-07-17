import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mp_online/app/data/constants/image_constants.dart';
import 'package:mp_online/common/common_widgets.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx(() {
        controller.count.value;
        return InkWell(
          onTap: (){
            controller.onClickScreen();
          },
          child: Center(
            child:CommonWidgets.appImagesView(
              imagePath: ImageConstants.imageSplash,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.fill
            ),
          ),
        );
      })
    );
  }
}
