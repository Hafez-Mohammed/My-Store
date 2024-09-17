// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
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
          onRefresh: () async{
            await controller.refreshPage();
          },
          child: HandlingDataView(
                requestStatus: controller.requestStatus,
                widget: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
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
                                await searchController
                                    .getSearchResults(controller.searchText.text);
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          IconButton(
                              onPressed: () {
                                controller.goToNotifications();
                              },
                              icon: Icon(
                                Icons.notifications_none_outlined,
                                size: 30,
                                color: Color.fromRGBO(34, 34, 34, 1),
                              ))
                        ],
                      ),
                      //  end search
          
                      Container(
                        padding: EdgeInsets.only(top: 5),
                        height: Get.height/1.5,
                        child: GetBuilder<SearchControllerImp>(
                          builder: (controller) => controller.isSearch
                              ? controller.requestStatus != null
                                  ? HandlingDataView(
                                      requestStatus: controller.requestStatus!,
                                      widget: GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: 0.7),
                                        itemCount: controller.results.length,
                                        itemBuilder: (context, index) =>
                                            ProductsView(
                                                productModel:
                                                    controller.results[index]),
                                      ))
                                  : Center()
                              : ListView(
                                  children: [
                                    // begin Categories list
                                    Padding(
                                      padding:
                                          const EdgeInsets.symmetric(vertical: 7),
                                      child: SizedBox(
                                        height: 110,
                                        child: CategoriesList(),
                                      ),
                                    ),
          
                                    // Offers Slider
                                    HomeOffersList(),
                                    //  Filterd Products
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20, bottom: 5, top: 10),
                                      child: Text(
                                        "67".tr,
                                        style: AppTheme.englishLightTheme
                                            .textTheme.bodyLarge!
                                            .copyWith(fontSize: 18),
                                      ),
                                    ),
                                    HomeFilterdProducts()
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
