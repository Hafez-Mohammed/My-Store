import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/favorite_controller.dart';
import 'package:my_store/controller/home_page_controller.dart';
import 'package:my_store/controller/search_controller.dart';
import 'package:my_store/core/classes/handling_data_view.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:my_store/core/constants/app_theme.dart';
import 'package:my_store/view/widget/homepage/categories_list.dart';
import 'package:my_store/view/widget/homepage/home_filterd_products.dart';
import 'package:my_store/view/widget/homepage/home_offers_list.dart';
import 'package:my_store/view/widget/homepage/search_textfield.dart';
import 'package:my_store/view/widget/products/products_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomePageControllerImp());
    Get.put(
      FavoriteController(),
    );
    SearchControllerImp searchController = Get.put(SearchControllerImp());
    return GetBuilder<HomePageControllerImp>(
        builder: (controller) => RefreshIndicator.adaptive(
              color: AppColors.onboardingMainColor,
              onRefresh: () async {
                await controller.refreshPage();
              },
              child: HandlingDataView(
                requestStatus: controller.requestStatus,
                widget: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Column(
                    children: [
                      // search text field and notification button
                      Row(
                        children: [
                          Expanded(
                            child: SearchTextfield(
                              hint: "65".tr,
                              controller: controller.searchText,
                              onChanged: (val) {
                                searchController.showSearch(val);
                              },
                              onIconPressed: () async {
                                await searchController.getSearchResults(
                                    controller.searchText.text);
                              },
                            ),
                          ),
                          10.horizontalSpace,
                          IconButton(
                              onPressed: () {
                                controller.goToNotifications();
                              },
                              icon: Icon(
                                Icons.notifications_none_outlined,
                                size: 30.r,
                                color: const Color.fromRGBO(34, 34, 34, 1),
                              ))
                        ],
                      ),
                      //  end search

                      Expanded(
                        child: GetBuilder<SearchControllerImp>(
                          builder: (controller) => controller.isSearch
                              // if user type in search text feild will show  results
                              ? controller.requestStatus != null
                                  ? HandlingDataView(
                                      requestStatus: controller.requestStatus!,
                                      widget: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: ScreenUtil()
                                                            .deviceType(
                                                                context) ==
                                                        DeviceType.mobile
                                                    ? 2
                                                    : 3,
                                                childAspectRatio: 0.7),
                                        itemCount: controller.results.length,
                                        itemBuilder: (context, index) =>
                                            ProductsView(
                                                productModel:
                                                    controller.results[index]),
                                      ))
                                  : const Center()
                              // if there is no search show home page content
                              : ListView(
                                  children: [
                                    // begin Categories list
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 7),
                                      child: SizedBox(
                                        height: 110.h,
                                        child: const CategoriesList(),
                                      ),
                                    ),
                        
                                    // Offers Slider
                                    const HomeOffersList(),
                                    //  Filterd Products
                                    Padding(
                                      padding: const EdgeInsets.only(
                                              left: 20, bottom: 5, top: 10)
                                          .r,
                                      child: Text(
                                        "67".tr,
                                        style: AppTheme.englishLightTheme
                                            .textTheme.bodyLarge!
                                            .copyWith(fontSize: 18.sp),
                                      ),
                                    ),
                                    const HomeFilterdProducts()
                                  ],
                                ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
