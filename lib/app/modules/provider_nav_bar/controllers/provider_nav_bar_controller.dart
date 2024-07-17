import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mp_online/app/modules/home/views/home_view.dart';
import 'package:mp_online/app/modules/jobs/views/jobs_view.dart';
import 'package:mp_online/app/modules/news/views/news_view.dart';
import 'package:mp_online/app/modules/profile/views/profile_view.dart';

class ProviderNavBarController extends GetxController {
  final tabIndex=0.obs;

  final count = 0.obs;

  List<Widget> tabs= [const HomeView(),const JobsView(),const NewsView(),const ProfileView()];
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