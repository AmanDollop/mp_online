import 'package:get/get.dart';
import 'package:mp_online/app/data/apis/api_models/get_proposal_at_my_project_model.dart';
import 'package:mp_online/app/routes/app_pages.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/local_data.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_my_project_model.dart';

class ProjectDetailProposalController extends GetxController {
  List<ProposalAtMyProjectData> proposalList=[];
  final tabIndex = 0.obs;
  final count = 0.obs;
  final isLoading =true.obs;
  GetMyProjectData getMyProjectData=Get.arguments;
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

  clickOnTab(int index){
    tabIndex.value=index;
    increment();
  }

  clickOnChatButton(int index){
    Map<String,String> data={
     ApiKeyConstants.otherUserId:proposalList[index].userId??'' ,
     ApiKeyConstants.otherUserName:'${proposalList[index].userData![0].firstName} ${proposalList[index].userData![0].lastName}' ,
      ApiKeyConstants.image:proposalList[index].userData![0].image??''
    };
    Get.toNamed(Routes.CHAT,parameters: data);
  }

  getMyProposals() async {
    try {
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId:Get.find<LocalUserData>().userId.value,
        ApiKeyConstants.projectId:getMyProjectData.id??'',
      };
      ProposalAtMyProjectModel? getMyProjectModel =
      await ApiMethods.getProposalsAtMyProjectsApi(
          bodyParams: bodyParams);
      if (getMyProjectModel != null && getMyProjectModel.status == '1') {
        proposalList=getMyProjectModel.data!;
      }else{
        CommonWidgets.showToastMessage(getMyProjectModel!.message ?? '');
      }
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      print('Error:-${e.toString()}');
    }
  }

  downloadFile(String url) async{
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
