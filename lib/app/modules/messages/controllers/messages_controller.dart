import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mp_online/app/data/apis/api_models/get_chat_user_list_model.dart';
import 'package:mp_online/app/routes/app_pages.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/local_data.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class MessagesController extends GetxController {
  TextEditingController searchController=TextEditingController();
  final isSearch=false.obs;
  FocusNode focusSearch=FocusNode();

  void startListener() {
    focusSearch.addListener(onFocusChange);
  }

  void onFocusChange() {
    isSearch.value = focusSearch.hasFocus;
  }
  List<ChatUserListResult> chatUserList=[];
  final count = 0.obs;
  final isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    geChatUserList();
    startListener();
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

  clickOnCard(int index){
    Map<String,String> data={
      ApiKeyConstants.otherUserId:chatUserList[index].id??'',
      ApiKeyConstants.image:chatUserList[index].image??'',
      ApiKeyConstants.otherUserName:'${chatUserList[index].firstName} ${chatUserList[index].lastName}',
    };
    Get.toNamed(Routes.CHAT,parameters: data);
  }

  geChatUserList() async {
    try {
      Map<String, String> bodyParams = {
        ApiKeyConstants.receiverId:Get.find<LocalUserData>().userId.value
      };
      ChatUserListModel? chatUserListModel =
      await ApiMethods.getAllChatUserListApi(
          bodyParams: bodyParams);
      if (chatUserListModel != null && chatUserListModel.status == '1') {
        chatUserList=chatUserListModel.result!;
      }else{
        CommonWidgets.showToastMessage(chatUserListModel!.message ?? '');
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      print('Error:-${e.toString()}');
    }
  }
}
