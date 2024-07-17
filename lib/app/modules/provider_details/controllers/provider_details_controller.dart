import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_category_model.dart';
import '../../../data/apis/api_models/get_providers_model.dart';
import '../../../routes/app_pages.dart';

class ProviderDetailsController extends GetxController {
  GetProviderData getProviderData=Get.arguments;
  List<GetCategoryResult> categoryList=[];
  final count = 0.obs;
  final tabIndex = 0.obs;
  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getCategory();
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

  clickOnChatIcon(){
    Map<String,String> data={
      ApiKeyConstants.otherUserId:getProviderData.id??'',
      ApiKeyConstants.otherUserName:'${getProviderData.firstName} ${getProviderData.lastName}',
      ApiKeyConstants.image:getProviderData.shopBanner??''
    };
    print("data:-$data");
    Get.toNamed(Routes.CHAT,parameters: data);
  }


  getCategory() async {
    try {
      GetCategoryModel? getCategoryModel =
      await ApiMethods.getCategoryApi();
      if (getCategoryModel != null && getCategoryModel.status == '1'&&getCategoryModel.result!.isNotEmpty) {
        categoryList=getCategoryModel.result!;
      }
    }catch(e){
      print('Error:-${e.toString()}');
    }
    increment();
  }
}
