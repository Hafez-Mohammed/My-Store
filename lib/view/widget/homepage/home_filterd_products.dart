import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/home_page_controller.dart';
import 'package:my_store/core/constants/api_links.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/functions/translate_database.dart';
import 'package:my_store/data/model/product.dart';

class HomeFilterdProducts extends GetView<HomePageControllerImp> {
  const HomeFilterdProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.9,
          crossAxisCount:
              ScreenUtil().deviceType(context) == DeviceType.mobile ? 2 : 3),
      itemBuilder: (context, index) => Product(
          productModel: ProductModel.fromJson(controller.products[index])),
    );
  }
}

class Product extends StatelessWidget {
  final ProductModel productModel;
  const Product({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.productDetails,
            arguments: {"model": productModel});
      },
      child: SizedBox(
        child: Column(
          children: [
            Card(
              color: AppColors.homeBackgroundColor,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: "${ApiLinks.productsImage}/${productModel.image}",
                    width: 140.w,
                    height: 120.h,
                  ),
                  Positioned(
                      top: 5,
                      left: 5,
                      child: Text(
                        "${productModel.discount} %",
                        style:  TextStyle(color: Colors.red, fontSize: 14.sp),
                      ))
                ],
              ),
            ),
            Text(
              translateDatabase(productModel.nameAr, productModel.name),
              textAlign: TextAlign.center,
              style:  TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            Text(
              "${productModel.disPrice!.toPrecision(1)} \$",
              style:  TextStyle(fontSize: 14.sp),
            ),
          ],
        ),
      ),
    );
  }
}
