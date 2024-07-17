import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mp_online/app/data/constants/icons_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/document_controller.dart';

class DocumentView extends GetView<DocumentController> {
  const DocumentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CommonWidgets.appBarView(title:StringConstants.document,),
      body: Padding(
        padding:  EdgeInsets.all(20.px),
        child: Column(
          children: [
          Stack(
            children: [
              CommonWidgets.appImagesView(
                  imagePath:'assets/images/img_adhar.png' ,
                height: 200.px,width: double.infinity,
                fit: BoxFit.fill
              ),
              Positioned(
                top: 20,right: 20,
                  child: CommonWidgets.appImagesView(
                      imagePath:IconConstants.icDelete ,
                      height: 35.px,width:35,
                      fit: BoxFit.fill
                  ),
              )
            ],
          ),
            SizedBox(height: 30.px,),
            Stack(
              children: [
                CommonWidgets.appImagesView(
                    imagePath:'assets/images/img_pan.png' ,
                    height: 200.px,width: double.infinity,
                    fit: BoxFit.fill
                ),
                Positioned(
                  top: 20,right: 20,
                  child: CommonWidgets.appImagesView(
                      imagePath:IconConstants.icDelete ,
                      height: 35.px,width:35,
                      fit: BoxFit.fill
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
