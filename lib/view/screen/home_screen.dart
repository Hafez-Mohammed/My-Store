// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/home_screen_controller.dart';
import 'package:my_store/view/widget/custom_bottom_navigation_bar.dart';
import 'package:my_store/view/widget/homepage/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: controller.currentPage == 0
            ? CustomAppBar(
                onPressedOrderIcon: () {},
                onPressedFavoriteIcon: () {
                  controller.goToMyFavorites();
                },
              )
            : null,
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: controller.pages[controller.currentPage]
      ),
    );
  }
}
