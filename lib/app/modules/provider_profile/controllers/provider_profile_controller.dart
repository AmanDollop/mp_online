import 'package:get/get.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_category_model.dart';
import 'package:mp_online/app/data/apis/api_models/get_user_model.dart';

class ProviderProfileController extends GetxController {
  UserData userData=Get.arguments;
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