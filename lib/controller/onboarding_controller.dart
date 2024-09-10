import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/services/app_services.dart';
import 'package:my_store/data/data_source/static/statics.dart';

abstract class OnboardingController extends GetxController {
  // this method move to the next page in slider
  next();
  // this method animate the slide_controller
  onChange(int index);
}

class OnboardingControllerImp extends OnboardingController {
  int currentPage = 0;
  late PageController pageController;
  late AppServices services;
  @override
  void onInit() {
    pageController = PageController();
    services = Get.find();
    super.onInit();
  }

  @override
  next() {
    currentPage++;
    if (currentPage > onboardingList.length-1 ) {
      services.preferences.setString("step", "1");
      Get.offNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(currentPage,
        duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
    update();
    }
    
  }

  @override
  onChange(int index) {
    currentPage = index;
    update();
  }
}
