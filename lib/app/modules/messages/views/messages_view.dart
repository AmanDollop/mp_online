import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mp_online/app/data/constants/string_constants.dart';
import 'package:mp_online/common/common_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../data/apis/api_models/get_chat_user_list_model.dart';
import '../../../data/constants/image_constants.dart';
import '../controllers/messages_controller.dart';

class MessagesView extends GetView<MessagesController> {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommonWidgets.appBarView(title: StringConstants.message),
      body:Obx((){
        controller.count.value;
        return  Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.px),
              child: CommonWidgets.commonTextFieldForLoginSignUP(
                focusNode: controller.focusSearch,
                controller: controller.searchController,
                hintText: StringConstants.search,
                keyboardType: TextInputType.name,
                isCard: controller.isSearch.value,
                prefixIcon: Icon(Icons.search,size: 20.px,color: Colors.black54,)
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: showAllMessage()
              ),
            ),
          ],
        );
      })
    );
  }


  Widget showAllMessage() {
    return controller.isLoading.value?
    CommonWidgets.commonShimmer(
      itemCount: 8,
      shimmerWidget:
        ListTile(

          leading: Container(
            height: 40.px,width: 40.px,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20.px)
              ),
          ),
          title: Container(
            height: 15.px,width: 200.px,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(3.px)
            ),
          ),
          subtitle:  Container(
            height: 15.px,width: 140.px,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(3.px)
            ),
          ),
          trailing:  Container(
            height: 15.px,width: 50.px,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(3.px)
            ),
          ),
        )
    ):
      ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: controller.chatUserList.length,
        itemBuilder: (context, index) {
          ChatUserListResult item=controller.chatUserList[index];
          return
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.px))
              ),
              semanticContainer: true,
              clipBehavior: Clip.hardEdge,
              elevation: 2.px,
              color: primary3Color,
              shadowColor: primary3Color,
              margin: EdgeInsets.symmetric(horizontal:10.px,vertical:5.px),
              child: ListTile(
                onTap: (){
                  controller.clickOnCard(index);
                },
                contentPadding: EdgeInsets.symmetric(horizontal: 3.px,vertical: 5.px),
                leading: CommonWidgets.imageView(
                    image: ImageConstants.imageBoy,
                    width: 50.px,
                    height: 50.px,
                    fit: BoxFit.fill,
                    borderRadius:BorderRadius.circular(10.px),
                    defaultNetworkImage: StringConstants.defaultUserImage
                ),
                title: Text('${item.firstName}', style: MyTextStyle.titleStyle16bb,),
                subtitle: Text(
                  ' ${item.lastName}', style: MyTextStyle.titleStyle12b,),
                trailing: Text(
                  '10 min ago', style: MyTextStyle.titleStyle12b,
                  textAlign: TextAlign.end,),
              ),
            );
        });
  }

}
