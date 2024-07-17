import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mp_online/app/modules/add_project/views/add_project_view.dart';
import 'package:mp_online/app/modules/home/views/home_view.dart';
import 'package:mp_online/app/modules/jobs/views/jobs_view.dart';
import 'package:mp_online/app/modules/news/views/news_view.dart';
import 'package:mp_online/app/modules/profile/views/profile_view.dart';
import 'package:mp_online/app/modules/providers/views/providers_view.dart';

class NavBarController extends GetxController {
  final tabIndex=0.obs;

  final count = 0.obs;

  List<Widget> tabs= [const ProvidersView(),const JobsView(),const AddProjectView(),const NewsView(),const ProfileView()];

  @override
  void onInit() {
    super.onInit();
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

  changeTabIndex(int index){
    tabIndex.value=index;
    increment();
  }
}
