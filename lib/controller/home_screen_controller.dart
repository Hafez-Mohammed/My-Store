// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/view/screen/cart.dart';
import 'package:my_store/view/screen/home_page.dart';
import 'package:my_store/view/screen/orders.dart';
import 'package:my_store/view/screen/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int index);
  goToMyFavorites();
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> pages = [];

  @override
  void onInit() {
    pages = [
      HomePage(),
      Cart(),
      Orders(),
      Settings(),
    ];

    super.onInit();
  }

  @override
  changePage(int index) {
    currentPage = index;
    update();
  }

  @override
  goToMyFavorites() {
    Get.toNamed(AppRoutes.myFavorites);
  }
}
