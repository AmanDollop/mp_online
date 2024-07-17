import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mp_online/app/data/apis/api_models/get_news_model.dart';
import 'package:mp_online/app/data/constants/image_constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CommonWidgets.appBarView(title: 'Latest News',showBackIcon: false),
      body:Obx((){
        controller.count.value;
        return  SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: showAllNews()
        );
      }),
    );
  }


  Widget showAllNews(){
    return   controller.isLoading.value?
    CommonWidgets.commonShimmer(
      height: 330.px,
      itemCount: 4,
    ): ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount:controller.newsList.length,
        itemBuilder: (context, index){
          NewsResult item=controller.newsList[index];
          return
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.px))
              ),
              semanticContainer: true,
              clipBehavior: Clip.hardEdge,
              elevation: 5.px,
              color: primary3Color,
              shadowColor: primary3Color,
              margin: EdgeInsets.all(10.px),
              child: GestureDetector(
                onTap: (){
                  controller.clickOnMoreDetailButton(index);
                },
                child: Container(
                  height: 330.px,
                  constraints: BoxConstraints(minHeight: 200.px,maxHeight: 330.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     CommonWidgets.imageView(
                         image:item.image??'',
                       width: double.infinity,height: 170.px,
                       fit: BoxFit.cover,
                       defaultNetworkImage: StringConstants.defaultNewsImage
                     ),
                      Padding(
                        padding:  EdgeInsets.all(10.px),
                        child: Text(removeAllHtmlTags(item.title??''),style: MyTextStyle.titleStyle14b,maxLines: 2,),

                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding:  EdgeInsets.only(right:10.px),
                          child: Text(item.dateTime.toString().substring(0,10)??'',style: MyTextStyle.titleStyle12b,),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(10.px),
                        child: Text(removeAllHtmlTags(item.description??''),style: MyTextStyle.titleStyle12b,maxLines: 4,),
                      ),

                    ],
                  ),
                ),
              ),
            );
        });
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
        r"<[^>]*>",
        multiLine: true,
        caseSensitive: true
    );

    return htmlText.replaceAll(exp, '');
  }
}
