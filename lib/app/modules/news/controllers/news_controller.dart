import 'package:get/get.dart';
import 'package:mp_online/app/data/apis/api_models/get_news_model.dart';
import 'package:mp_online/app/routes/app_pages.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class NewsController extends GetxController {
  //TODO: Implement NewsController
  List<NewsResult>  newsList=[];
  final count = 0.obs;
  final isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    getAllNews();
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
    Get.toNamed(Routes.NEWS_DETAILS,arguments: newsList[index]);
  }

  getAllNews() async {
    try {
      NewsModel? newsModel =
      await ApiMethods.getAllNewsApi();
      if (newsModel != null && newsModel.status == '1') {
        newsList=newsModel.result!;
      }else{
        CommonWidgets.showToastMessage(newsModel!.message ?? '');
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      print('Error:-${e.toString()}');
    }
  }
}
