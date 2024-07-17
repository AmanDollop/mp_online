import 'dart:convert';

import 'package:get/get.dart';
import 'package:mp_online/app/data/apis/api_constants/api_key_constants.dart';
import 'package:mp_online/app/data/apis/api_models/get_user_model.dart';
import 'package:mp_online/app/data/constants/icons_constant.dart';
import 'package:mp_online/app/data/constants/string_constants.dart';
import 'package:mp_online/app/routes/app_pages.dart';
import 'package:mp_online/common/common_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/local_data.dart';

class ProfileController extends GetxController {
  late UserData userData;
  final count = 0.obs;
  final name = ''.obs;
  final image = ''.obs;
  final type = ''.obs;
  List<Map<String,String>> items=[];
  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    type.value = sharedPreferences.getString(ApiKeyConstants.userType) ??'';
    print('userType.value    ${type.value}');
    super.onInit();
    getLocalData();
    print('type.value:::::::::${type.value}');
    items=[
      {
        'icon':IconConstants.icChangePassword,
        'name':StringConstants.changePassword
      },
      {
        'icon':IconConstants.icDocument,
        'name': type.value != StringConstants.provider ? type.value == StringConstants.user ? StringConstants.myAccount:StringConstants.myTutorAccount: StringConstants.myTutorAccount
      },
      {
        'icon':IconConstants.icDocument,
        'name':StringConstants.document
      },
      {
        'icon':IconConstants.icNotificationYellow,
        'name':StringConstants.notifications
      },
      {
        'icon':IconConstants.icSubscription,
        'name':StringConstants.subscription
      },
      {
        'icon':IconConstants.icFaq,
        'name':StringConstants.fAQ
      },
      {
        'icon':IconConstants.icAboutUs,
        'name':StringConstants.aboutUs
      },
      {
        'icon':IconConstants.icPrivacyPolicy,
        'name':StringConstants.termAndConditions
      },
      {
        'icon':IconConstants.icPrivacyPolicy,
        'name':StringConstants.privacyPolicy
      },
      {
        'icon':IconConstants.icPrivacyPolicy,
        'name':StringConstants.logout
      },
    ];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  getLocalData() async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
     if(jsonData!=null){
       userData = UserData.fromJson(jsonData);
       name.value='${userData.firstName} ${userData.lastName}';
       image.value=userData.image??'';
       type.value=userData.type??'';
       print('user_id ${userData.id}');
       increment();
     }else{
       CommonWidgets.showToastMessage('Token expired please again login');
     }
  }

  clickOnProfile(){
    Get.find<LocalUserData>().loginTypeUser.value?
    Get.toNamed(Routes.EDIT_PROFILE):Get.toNamed(Routes.PROVIDER_PROFILE,arguments: userData);
  }


  openNewPage(int index){
    Map<String,String> data={
      ApiKeyConstants.userId:userData.id??'',
      ApiKeyConstants.firstName:userData.firstName??'',
      ApiKeyConstants.lastName:userData.lastName??'',
      ApiKeyConstants.image:userData.image??'',
      ApiKeyConstants.mobile:userData.mobile??'',

    };
    switch(index){
      case 0:
       Get.toNamed(Routes.CHANGE_PASSWORD,parameters: data);
        break;
        case 1:
          type.value != StringConstants.provider ? type.value == StringConstants.user ? Get.toNamed(Routes.MY_ACCOUNT,parameters: data):Get.toNamed(Routes.PROVIDER_PROPOSALS,parameters: data): Get.toNamed(Routes.PROVIDER_PROPOSALS,parameters: data);
          break;
      case 2:
        Get.toNamed(Routes.DOCUMENT,parameters: data);
        break;
      case 3:
        Get.toNamed(Routes.NOTIFICATIONS,parameters: data);
        break;
      case 4:
        Get.toNamed(Routes.SUBSCRIPTION,parameters: data);
        break;
      case 5:
        Get.toNamed(Routes.FAQ,parameters: data);
        break;
      case 6:
        Get.toNamed(Routes.ABOUT_US,parameters: data);
        break;
      case 7:
        Get.toNamed(Routes.TERMS_CONDITION,parameters: data);
        break;
      case 8:
        Get.toNamed(Routes.PRIVACY_POLICY,parameters: data);
        break;
      case 9:
        Get.toNamed(Routes.LOGOUT,parameters: data);
        break;
    }
  }
}
