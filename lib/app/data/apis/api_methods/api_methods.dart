import 'package:http/http.dart' as http;
import 'package:mp_online/app/data/apis/api_models/get_category_model.dart';
import 'package:mp_online/app/data/apis/api_models/get_chat_user_list_model.dart';
import 'package:mp_online/app/data/apis/api_models/get_job_vacancy.dart';
import 'package:mp_online/app/data/apis/api_models/get_my_project_model.dart';
import 'package:mp_online/app/data/apis/api_models/get_news_model.dart';
import 'package:mp_online/app/data/apis/api_models/get_proposal_at_my_project_model.dart';
import 'package:mp_online/app/data/apis/api_models/get_providers_model.dart';
import 'package:mp_online/app/data/apis/api_models/get_send_otp_model.dart';
import 'package:mp_online/app/data/apis/api_models/get_simple_respose_model.dart';
import 'package:mp_online/app/data/apis/api_models/get_user_model.dart';
import 'dart:convert';
import 'dart:io';

import '../../../../common/http_methods.dart';
import '../api_constants/api_url_constants.dart';
import '../api_models/get_chat_model.dart';
import '../api_models/get_my_submited_proposal_model.dart';
import '../api_models/get_signup_model.dart';
import 'get_tutar_enquiry_model.dart';


class ApiMethods {
 /* static Future<UserModel?> login({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfLogin,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }*/

  static Future<SignUpModel?> userRegister({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SignUpModel? signUpModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfRegister,
      checkResponse: checkResponse,
    );
    if (response != null) {
      signUpModel = SignUpModel.fromJson(jsonDecode(response.body));
      return signUpModel;
    }
    return null;
  }

  static Future<SignUpModel?> register({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
    Map<String, File>? imageMap,
  }) async {
    SignUpModel? signUpModel;
    http.Response? response = await MyHttp.multipart(
      bodyParams: bodyParams,
      imageMap: imageMap,
      url: ApiUrlConstants.endPointOfRegister,
      checkResponse: checkResponse,
    );
    if (response != null) {
      signUpModel = SignUpModel.fromJson(jsonDecode(response.body));
      return signUpModel;
    }
    return null;
  }


/// Send Otp for login .....
  static Future<SendOtpModel?> sendOtpApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SendOtpModel? sendOtpModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfSendOtp,
      checkResponse: checkResponse,
    );
    if (response != null) {
      sendOtpModel = SendOtpModel.fromJson(jsonDecode(response.body));
      return sendOtpModel;
    }
    return null;
  }

  /// Check Otp for login .....
  static Future<UserModel?> checkOtpApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfCheckOtp,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }


  /// Change Password Api .....
  static Future<UserModel?> changePasswordApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfChangePassword,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }
   /// Add Project Api....
  static Future<SimpleResponseModel?> addProjectApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
    Map<String, File>? imageMap,
  }) async {
    SimpleResponseModel? simpleResponseModel;
    http.Response? response = await MyHttp.multipart(
      bodyParams: bodyParams,
      imageMap: imageMap,
      url: ApiUrlConstants.endPointOfAddPost,
      checkResponse: checkResponse,
    );
    if (response != null) {
      simpleResponseModel = SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  /// Add Tutor Enquiry Api....
  static Future<SimpleResponseModel?> addTutarEnquiryApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
    Map<String, File>? imageMap,
  }) async {
    SimpleResponseModel? simpleResponseModel;
    http.Response? response = await MyHttp.multipart(
      bodyParams: bodyParams,
      imageMap: imageMap,
      url: ApiUrlConstants.endPointOfAddTutarEnquiry,
      checkResponse: checkResponse,
    );
    if (response != null) {
      simpleResponseModel = SimpleResponseModel.fromJson(jsonDecode(response.body));
      return simpleResponseModel;
    }
    return null;
  }

  /// Get My Project Api .....
  static Future<GetMyProjectModel?> getMyProjectApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetMyProjectModel? getMyProjectModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetUserPost,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getMyProjectModel = GetMyProjectModel.fromJson(jsonDecode(response.body));
      return getMyProjectModel;
    }
    return null;
  }

  /// Get All Project Api .....
  static Future<GetMyProjectModel?> getAllProjectApi({
    void Function(int)? checkResponse,
  }) async {
    GetMyProjectModel? getMyProjectModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetAllPost,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getMyProjectModel = GetMyProjectModel.fromJson(jsonDecode(response.body));
      return getMyProjectModel;
    }
    return null;
  }
  /// Get Tutor .....
  static Future<GetTutarEnquiryModel?> getTutarEnquiryApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,

  }) async {
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConstants.endPointOfGetTutarEnquiry,
      bodyParams: bodyParams,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return GetTutarEnquiryModel.fromJson(jsonDecode(response.body));
    }
    return null;
  }

  /// Get All Provider Api .....
  static Future<GetProviderModel?> getAllProviderApi({
    void Function(int)? checkResponse,
  }) async {
    GetProviderModel? getProviderModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetProviderList,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getProviderModel = GetProviderModel.fromJson(jsonDecode(response.body));
      return getProviderModel;
    }
    return null;
  }

  /// Get All Chat User List Api .....
  static Future<ChatUserListModel?> getAllChatUserListApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    ChatUserListModel? chatUserListModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetChatUserList,
      checkResponse: checkResponse,
    );
    if (response != null) {
      chatUserListModel = ChatUserListModel.fromJson(jsonDecode(response.body));
      return chatUserListModel;
    }
    return null;
  }

   /// Insert Chat Message Api...
  static Future<http.Response?> insertChat(
      {void Function(int)? checkResponse,
        required Map<String, dynamic> bodyParams,
        File? image,
        String? imageKey,
        bool wantSnackBar = true}) async {
    http.Response? response = await MyHttp.multipart(
      url: ApiUrlConstants.endPointOfInsertChat,
      image: image,
      imageKey: imageKey,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      return response;
    }
    return null;
  }


/// Get Chat Message  api ...
  static Future<GetChatModel?> getChat(
      {void Function(int)? checkResponse,
        Map<String, dynamic>? bodyParams,
        bool wantSnackBar = true}) async {
    GetChatModel getChatModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetChat,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getChatModel = GetChatModel.fromJson(jsonDecode(response.body));
      return getChatModel;
    }
    return null;
  }

  /// Send Proposal Request for project .....
  static Future<SimpleResponseModel?> sendProposalRequestApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SimpleResponseModel? sendOtpModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfSendProposal,
      checkResponse: checkResponse,
    );
    if (response != null) {
      sendOtpModel = SimpleResponseModel.fromJson(jsonDecode(response.body));
      return sendOtpModel;
    }
    return null;
  }

  /// Get My Submitted Proposals .....
  static Future<GetMySubmittedProposalModel?> getMySubmittedProposalApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetMySubmittedProposalModel? sendOtpModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfSendProposal,
      checkResponse: checkResponse,
    );
    if (response != null) {
      sendOtpModel = GetMySubmittedProposalModel.fromJson(jsonDecode(response.body));
      return sendOtpModel;
    }
    return null;
  }


  /// Get My Submitted Proposals Api .....
  static Future<GetMySubmittedProposalModel?> getMySubmittedProposalsApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetMySubmittedProposalModel? getMyProjectModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetSubmittedProposal,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getMyProjectModel = GetMySubmittedProposalModel.fromJson(jsonDecode(response.body));
      return getMyProjectModel;
    }
    return null;
  }

  /// Get Proposals at my project Api .....
  static Future<ProposalAtMyProjectModel?> getProposalsAtMyProjectsApi({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    ProposalAtMyProjectModel? proposalAtMyProjectModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetProposalAtMyProject,
      checkResponse: checkResponse,
    );
    if (response != null) {
      proposalAtMyProjectModel = ProposalAtMyProjectModel.fromJson(jsonDecode(response.body));
      return proposalAtMyProjectModel;
    }
    return null;
  }


  /// Get All News Api .....
  static Future<NewsModel?> getAllNewsApi({
    void Function(int)? checkResponse,
  }) async {
    NewsModel? newsModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetNews,
      checkResponse: checkResponse,
    );
    if (response != null) {
      newsModel = NewsModel.fromJson(jsonDecode(response.body));
      return newsModel;
    }
    return null;
  }

  /// Get All Job Vacancy Api .....
  static Future<JobVacancyModel?> getAllJobVacancyApi({
    void Function(int)? checkResponse,
  }) async {
    JobVacancyModel? newsModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetJobVacancy,
      checkResponse: checkResponse,
    );
    if (response != null) {
      newsModel = JobVacancyModel.fromJson(jsonDecode(response.body));
      return newsModel;
    }
    return null;
  }



  /// Get Category Api .....
  static Future<GetCategoryModel?> getCategoryApi({
    void Function(int)? checkResponse,
  }) async {
    GetCategoryModel? getCategoryModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetCategory,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getCategoryModel = GetCategoryModel.fromJson(jsonDecode(response.body));
      return getCategoryModel;
    }
    return null;
  }

}