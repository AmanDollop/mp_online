import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/MyTextStyle.dart';
import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_models/get_category_model.dart';
import '../../../data/constants/string_constants.dart';

import '../controllers/provider_profile_controller.dart';

class ProviderProfileView extends GetView<ProviderProfileController> {
  const ProviderProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return  Scaffold(
        appBar:CommonWidgets.appBarView(title:StringConstants.provider,),
        bottomNavigationBar: CommonWidgets.commonElevatedButton(
            onPressed: (){

            },
            child: Text(StringConstants.editProfile,style: MyTextStyle.titleStyle16bw,),
          buttonMargin: EdgeInsets.all(5.px),
          borderRadius: 10.px
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:  Container(
            margin: EdgeInsets.only(left:10.px,right: 10.px,top: 0.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CommonWidgets.imageView(
                    image:controller.userData.shopBanner??'',
                    width:double.infinity,height: 155.px,fit: BoxFit.fill,
                    borderRadius: BorderRadius.circular(0.px),
                    defaultNetworkImage: StringConstants.defaultMpOnlineShopBanner
                ),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 3.px,vertical: 0.px),
                  leading: CommonWidgets.imageView(
                      image:controller.userData.shopBanner??'',
                      width: 50.px,height: 50.px,fit: BoxFit.fill,
                      borderRadius: BorderRadius.circular(25.px),
                      defaultNetworkImage: StringConstants.defaultUserImage

                  ),
                  title: Text('${controller.userData.firstName} ${controller.userData.lastName}',style: MyTextStyle.titleStyle16bb,),
                  subtitle: Text('${controller.userData.shopAddress}',style: MyTextStyle.titleStyle12b,),

                ),

                Text(StringConstants.serviceName,style: MyTextStyle.titleStyle16bb,),
                showServicesList(),
                SizedBox(height: 10.px,),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child:GestureDetector(
                          onTap: (){
                            controller.tabIndex.value=0;
                          },
                          child: Container(
                            margin: EdgeInsets.only(left:10.px,right: 10.px,top: 0.px),
                            padding: EdgeInsets.all(8.px),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: controller.tabIndex.value==0?primaryColor:Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.px)
                            ),
                            child: Text(StringConstants.shopInfo,style: MyTextStyle.titleStyle16bw,),
                          ),
                        )
                    ),
                    Expanded(
                        flex: 1,
                        child:GestureDetector(
                          onTap: (){
                            controller.tabIndex.value=1;
                          },
                          child: Container(
                            margin: EdgeInsets.only(left:10.px,right: 10.px,top: 0.px),
                            padding: EdgeInsets.all(8.px),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: controller.tabIndex.value==1?primaryColor:Colors.grey.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10.px)
                            ),
                            child: Text(StringConstants.reviews,style: MyTextStyle.titleStyle16bw,),
                          ),
                        )
                    )
                  ],
                ),
                controller.tabIndex.value==0?
                Container(
                  child:showShopInfo() ,
                ):Container(
                  child:showAllReviews() ,
                )

              ],
            ),
          ),
        ),
      );
    });
  }

  Widget showServicesList(){
    return GridView.builder(
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // number of items in each row
          mainAxisSpacing: 10.px, // spacing between rows
          crossAxisSpacing: 10.px,
          childAspectRatio: 4
      ),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(8.0.px), // padding around the grid
      itemCount: controller.categoryList.length, // total number of items
      itemBuilder: (context, index) {
        GetCategoryResult item=controller.categoryList[index];
        return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: primary3Color,
                borderRadius: BorderRadius.circular(5.px),
                border: Border.all(color:Colors.grey.withOpacity(0.5),width: 1.px)
            ),
            clipBehavior: Clip.hardEdge,
            child:Text(item.categoryName??'',style: MyTextStyle.titleStyle10b,)
        );
      },
    );
  }
  Widget showShopInfo(){
    return Container(
      margin: EdgeInsets.all(5.px),
      child: Column(
        children: [
          SizedBox(height: 10.px,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.phone,size: 25.px,color: primaryColor,),
              Padding(
                padding: EdgeInsets.only(left: 5.px),
                child: Text(controller.userData.mobile??'',style: MyTextStyle.titleStyle16bb,),
              )
            ],
          ),
          SizedBox(height: 15.px,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.email_outlined,size: 25.px,color: primaryColor,),
              Padding(
                padding: EdgeInsets.only(left: 5.px),
                child: Text(controller.userData.email??'',style: MyTextStyle.titleStyle16bb,),
              )
            ],
          ),
          SizedBox(height: 15.px,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.app_registration,size: 25.px,color: primaryColor,),
              Padding(
                padding: EdgeInsets.only(left: 5.px),
                child: Text(controller.userData.createdAt??'',style: MyTextStyle.titleStyle16bb,),
              )
            ],
          ),
          SizedBox(height: 15.px,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.location_on,size: 25.px,color: primaryColor,),
              Padding(
                padding: EdgeInsets.only(left: 5.px),
                child: Text(controller.userData.address??'',style: MyTextStyle.titleStyle16bb,),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget showAllReviews(){
    return  controller.isLoading.value?
    CommonWidgets.commonShimmer(
      itemCount: 4,
    ):
    Column(
      children: [
        ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount:4,
            itemBuilder: (context, index){
              //userData item=controller.allProvidersList[index];
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
                  child: SizedBox(
                    height: 230.px,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 3.px,vertical: 0.px),
                            leading: CommonWidgets.imageView(
                                image:'',
                                width: 50.px,height: 50.px,fit: BoxFit.fill,
                                borderRadius: BorderRadius.circular(25.px),
                                defaultNetworkImage: StringConstants.defaultUserImage

                            ),
                            title: Text('Arvind Kumar Gupta',style: MyTextStyle.titleStyle16bb,),
                            subtitle:RatingBar.builder(
                              initialRating: 3,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 2.0.px),
                              itemSize: 18.px,
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 15.px,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            )
                        ),

                        Padding(
                          padding: EdgeInsets.all(5.0.px),
                          child: Text(StringConstants.test,style: MyTextStyle.titleStyle12b,textAlign: TextAlign.justify,),
                        ),

                      ],
                    ),
                  ),
                );
            }),
        // if(controller.allProvidersList.isEmpty)
        //   CommonWidgets.dataNotFound()
      ],
    );
  }
}
