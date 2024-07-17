import 'package:get/get.dart';

import '../modules/about_us/bindings/about_us_binding.dart';
import '../modules/about_us/views/about_us_view.dart';
import '../modules/add_project/bindings/add_project_binding.dart';
import '../modules/add_project/views/add_project_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/document/bindings/document_binding.dart';
import '../modules/document/views/document_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/faq/bindings/faq_binding.dart';
import '../modules/faq/views/faq_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/job_details/bindings/job_details_binding.dart';
import '../modules/job_details/views/job_details_view.dart';
import '../modules/jobs/bindings/jobs_binding.dart';
import '../modules/jobs/views/jobs_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/login_type/bindings/login_type_binding.dart';
import '../modules/login_type/views/login_type_view.dart';
import '../modules/logout/bindings/logout_binding.dart';
import '../modules/logout/views/logout_view.dart';
import '../modules/messages/bindings/messages_binding.dart';
import '../modules/messages/views/messages_view.dart';
import '../modules/my_account/bindings/my_account_binding.dart';
import '../modules/my_account/views/my_account_view.dart';
import '../modules/nav_bar/bindings/nav_bar_binding.dart';
import '../modules/nav_bar/views/nav_bar_view.dart';
import '../modules/news/bindings/news_binding.dart';
import '../modules/news/views/news_view.dart';
import '../modules/news_details/bindings/news_details_binding.dart';
import '../modules/news_details/views/news_details_view.dart';
import '../modules/notification_setting/bindings/notification_setting_binding.dart';
import '../modules/notification_setting/views/notification_setting_view.dart';
import '../modules/notifications/bindings/notifications_binding.dart';
import '../modules/notifications/views/notifications_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/privacy_policy/bindings/privacy_policy_binding.dart';
import '../modules/privacy_policy/views/privacy_policy_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/project_detail/bindings/project_detail_binding.dart';
import '../modules/project_detail/views/project_detail_view.dart';
import '../modules/project_detail_proposal/bindings/project_detail_proposal_binding.dart';
import '../modules/project_detail_proposal/views/project_detail_proposal_view.dart';
import '../modules/proposal_details/bindings/proposal_details_binding.dart';
import '../modules/proposal_details/views/proposal_details_view.dart';
import '../modules/provider_details/bindings/provider_details_binding.dart';
import '../modules/provider_details/views/provider_details_view.dart';
import '../modules/provider_nav_bar/bindings/provider_nav_bar_binding.dart';
import '../modules/provider_nav_bar/views/provider_nav_bar_view.dart';
import '../modules/provider_profile/bindings/provider_profile_binding.dart';
import '../modules/provider_profile/views/provider_profile_view.dart';
import '../modules/provider_proposals/bindings/provider_proposals_binding.dart';
import '../modules/provider_proposals/views/provider_proposals_view.dart';
import '../modules/provider_signup/bindings/provider_signup_binding.dart';
import '../modules/provider_signup/views/provider_signup_view.dart';
import '../modules/providers/bindings/providers_binding.dart';
import '../modules/providers/views/providers_view.dart';
import '../modules/search_job/bindings/search_job_binding.dart';
import '../modules/search_job/views/search_job_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/subscription/bindings/subscription_binding.dart';
import '../modules/subscription/views/subscription_view.dart';
import '../modules/terms_condition/bindings/terms_condition_binding.dart';
import '../modules/terms_condition/views/terms_condition_view.dart';
import '../modules/user_signup/bindings/user_signup_binding.dart';
import '../modules/user_signup/views/user_signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_TYPE,
      page: () => const LoginTypeView(),
      binding: LoginTypeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.USER_SIGNUP,
      page: () => const UserSignupView(),
      binding: UserSignupBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_SIGNUP,
      page: () => const ProviderSignupView(),
      binding: ProviderSignupBinding(),
    ),
    GetPage(
      name: _Paths.NAV_BAR,
      page: () => const NavBarView(),
      binding: NavBarBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADD_PROJECT,
      page: () => const AddProjectView(),
      binding: AddProjectBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_DETAIL,
      page: () => const ProjectDetailView(),
      binding: ProjectDetailBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGES,
      page: () => const MessagesView(),
      binding: MessagesBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.LOGOUT,
      page: () => const LogoutView(),
      binding: LogoutBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.TERMS_CONDITION,
      page: () => const TermsConditionView(),
      binding: TermsConditionBinding(),
    ),
    GetPage(
      name: _Paths.ABOUT_US,
      page: () => const AboutUsView(),
      binding: AboutUsBinding(),
    ),
    GetPage(
      name: _Paths.MY_ACCOUNT,
      page: () => const MyAccountView(),
      binding: MyAccountBinding(),
    ),
    GetPage(
      name: _Paths.PROJECT_DETAIL_PROPOSAL,
      page: () => const ProjectDetailProposalView(),
      binding: ProjectDetailProposalBinding(),
    ),
    GetPage(
      name: _Paths.DOCUMENT,
      page: () => const DocumentView(),
      binding: DocumentBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_SETTING,
      page: () => const NotificationSettingView(),
      binding: NotificationSettingBinding(),
    ),
    GetPage(
      name: _Paths.FAQ,
      page: () => const FaqView(),
      binding: FaqBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATIONS,
      page: () => const NotificationsView(),
      binding: NotificationsBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.JOBS,
      page: () => const JobsView(),
      binding: JobsBinding(),
    ),
    GetPage(
      name: _Paths.NEWS,
      page: () => const NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.SUBSCRIPTION,
      page: () => const SubscriptionView(),
      binding: SubscriptionBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDERS,
      page: () => const ProvidersView(),
      binding: ProvidersBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_PROPOSALS,
      page: () => const ProviderProposalsView(),
      binding: ProviderProposalsBinding(),
    ),
    GetPage(
      name: _Paths.PROPOSAL_DETAILS,
      page: () => const ProposalDetailsView(),
      binding: ProposalDetailsBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_DETAILS,
      page: () => const NewsDetailsView(),
      binding: NewsDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_DETAILS,
      page: () => const ProviderDetailsView(),
      binding: ProviderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_PROFILE,
      page: () => const ProviderProfileView(),
      binding: ProviderProfileBinding(),
    ),
    GetPage(
      name: _Paths.PROVIDER_NAV_BAR,
      page: () => const ProviderNavBarView(),
      binding: ProviderNavBarBinding(),
    ),
    GetPage(
      name: _Paths.JOB_DETAILS,
      page: () => const JobDetailsView(),
      binding: JobDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_JOB,
      page: () => const SearchJobView(),
      binding: SearchJobBinding(),
    ),
  ];
}
