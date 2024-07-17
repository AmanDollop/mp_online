import 'package:get/get.dart';
import 'package:mp_online/app/data/apis/api_models/get_my_submited_proposal_model.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/local_data.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../routes/app_pages.dart';

class ProviderProposalsController extends GetxController {
  Map<String,String?> parameters=Get.parameters;
  final count = 0.obs;
  final isLoading = true.obs;
  List<GetMySubmittedProposalData> myProposalList=[];
  @override
  void onInit() {
    super.onInit();
    getMyProposals();
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
    Get.toNamed(Routes.PROPOSAL_DETAILS,arguments: myProposalList[index]);
  }

  getMyProposals() async {
    try {
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId:Get.find<LocalUserData>().userId.value,
      };
      GetMySubmittedProposalModel? getMyProjectModel =
      await ApiMethods.getMySubmittedProposalsApi(
          bodyParams: bodyParams);
      if (getMyProjectModel != null && getMyProjectModel.status == '1') {
        myProposalList=getMyProjectModel.data!;
      }else{
        CommonWidgets.showToastMessage(getMyProjectModel!.message ?? '');
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      print('Error:-${e.toString()}');
    }
  }

}
