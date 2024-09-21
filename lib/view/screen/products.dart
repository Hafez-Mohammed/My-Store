import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/favorite_controller.dart';
import 'package:my_store/controller/products_controller.dart';
import 'package:my_store/core/classes/handling_data_view.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:my_store/core/functions/translate_database.dart';
import 'package:my_store/data/model/category.dart';
import 'package:my_store/view/widget/homepage/search_textfield.dart';
import 'package:my_store/view/widget/products/products_view.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    ProductsControllerImp controller = Get.put(ProductsControllerImp());
    FavoriteController favoriteController = Get.put(FavoriteController());
    return DefaultTabController(
      initialIndex: controller.selectedCat!,
      length: controller.categories.length,
      child: Scaffold(
        appBar: AppBar(
          title: SearchTextfield(
            hint: "68".tr,
            controller: controller.searchText,
            onChanged: (val) {
              controller.search(val);
            },
            onIconPressed: () {},
          ),
          bottom: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.center,
              labelColor: AppColors.onboardingMainColor,
              indicatorColor: AppColors.onboardingMainColor,
              overlayColor: MaterialStatePropertyAll(
                  AppColors.onboardingMainColor.withOpacity(0.1)),
              splashBorderRadius: BorderRadius.circular(10),
              onTap: (value) async {
                await controller.filterProducts(value);
              },
              tabs: [
                ...List.generate(controller.categories.length, (index) {
                  CategoryModel categoryModel =
                      CategoryModel.fromJson(controller.categories[index]);
                  return Tab(
                    text: translateDatabase(
                        categoryModel.nameAr, categoryModel.name),
                  );
                })
              ]),
        ),
        body: GetBuilder<ProductsControllerImp>(
            builder: (controller) => HandlingDataView(
                requestStatus: controller.requestStatus,
                widget: TabBarView(children: [
                  ...List.generate(
                      controller.categories.length,
                      (index) => controller.isSearch
                          // when user type a text in search textfield will show products matched as a result
                          ? controller.searchProducts.isNotEmpty
                              ? GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: ScreenUtil()
                                                      .deviceType(context) ==
                                                  DeviceType.mobile
                                              ? 2
                                              : 3,
                                          childAspectRatio: 0.7),
                                  itemCount: controller.searchProducts.length,
                                  itemBuilder: (context, index) {
                                    favoriteController.setFavorite(
                                        controller.searchProducts[index].id,
                                        controller
                                            .searchProducts[index].isfavorite);
                                    return ProductsView(
                                        productModel:
                                            controller.searchProducts[index]);
                                  })
                              : const Center(
                                  child: Text(
                                    "No results",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal),
                                  ),
                                )
                          // if search textfield is empty will display products that belongs to selectd category tab
                          : controller.products.isNotEmpty
                              ? GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: ScreenUtil()
                                                      .deviceType(context) ==
                                                  DeviceType.mobile
                                              ? 2
                                              : 3,
                                          childAspectRatio: 0.7),
                                  itemCount: controller.products.length,
                                  itemBuilder: (context, index) {
                                    favoriteController.setFavorite(
                                        controller.products[index].id,
                                        controller.products[index].isfavorite);
                                    return ProductsView(
                                        productModel:
                                            controller.products[index]);
                                  })
                              : const Center(
                                  child: Text(
                                  "There is not any product",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                )))
                ]))),
      ),
    );
  }
}
