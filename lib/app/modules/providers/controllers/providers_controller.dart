import 'package:get/get.dart';
import 'package:mp_online/app/data/apis/api_constants/api_key_constants.dart';
import 'package:mp_online/app/data/apis/api_models/get_providers_model.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/local_data.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_my_project_model.dart';
import '../../../routes/app_pages.dart';

class ProvidersController extends GetxController {
  final count = 0.obs;
  final isLoading = true.obs;
  List<GetProviderData> allProvidersList=[];
  @override
  void onInit() {
    super.onInit();
    getAllProviders();
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

  clickOnMoreDetailButton(int index){
    Get.toNamed(Routes.PROJECT_DETAIL);
  }

  clickOnMessageIcon(){
    Get.toNamed(Routes.MESSAGES);
  }

  clickOnMoreDetails(int index){
    Get.toNamed(Routes.PROVIDER_DETAILS,arguments: allProvidersList[index]);
  }

  getAllProviders() async {
    try {
      GetProviderModel? getProviderModel =
      await ApiMethods.getAllProviderApi();
      if (getProviderModel != null && getProviderModel.status == '1') {
        allProvidersList=getProviderModel.data!;
      }else{
        CommonWidgets.showToastMessage(getProviderModel!.message ?? '');
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      print('Error:-${e.toString()}');
    }
  }

  clickOnChatIcon(int index){
    Map<String,String> data={
      ApiKeyConstants.otherUserId:allProvidersList[index].id??'',
      ApiKeyConstants.otherUserName:'${allProvidersList[index].firstName} ${allProvidersList[index].lastName}',
      ApiKeyConstants.image:allProvidersList[index].shopBanner??''
    };
    print("data:-$data");
    Get.toNamed(Routes.CHAT,parameters: data);
  }
}
