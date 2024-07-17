import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mp_online/app/data/constants/string_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/common_widgets.dart';
import '../controllers/news_details_controller.dart';

class NewsDetailsView extends GetView<NewsDetailsController> {
  const NewsDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: StringConstants.newsDetail),
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding:  EdgeInsets.all(10.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CommonWidgets.imageView(
                  image:controller.newsResult.image??'',
                  width: double.infinity,height: 250.px,
                  fit: BoxFit.fill
              ),
              SizedBox(height: 5.px,),
              Padding(
                padding:  EdgeInsets.all(10.px),
                child: Text(controller.newsResult.title??'',style: MyTextStyle.titleStyle14bb,maxLines: 2,),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding:  EdgeInsets.only(right:10.px),
                  child: Text(controller.newsResult.dateTime.toString().substring(0,10)??'',style: MyTextStyle.titleStyle14b,),
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(10.px),
                child: Text(controller.newsResult.description??'',style: MyTextStyle.titleStyle12b,maxLines: 4,),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
