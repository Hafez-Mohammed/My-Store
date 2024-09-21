import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/home_screen_controller.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:my_store/core/constants/app_image_assets.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => BottomNavigationBar(
          currentIndex: controller.currentPage,
          onTap: (value) {
            controller.changePage(value);
          },
          selectedItemColor: AppColors.onboardingMainColor,
          unselectedItemColor: AppColors.homeIconGreyColor,
          backgroundColor: AppColors.homeBackgroundColor,
          showUnselectedLabels: true,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_rounded,
                  size: 30.r,
                ),
                label: "59".tr),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  AppImageAssets.cart,
                  width: 25.r,
                  height: 25.r,
                  color: controller.currentPage == 1
                      ? AppColors.onboardingMainColor
                      : AppColors.homeIconGreyColor,
                ),
                label: "60".tr),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined, size: 30.r),
                label: "61".tr),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings, size: 30.r), label: "62".tr),
          ]),
    );
  }
}
