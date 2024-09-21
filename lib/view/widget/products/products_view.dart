// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/favorite_controller.dart';
import 'package:my_store/controller/products_controller.dart';
import 'package:my_store/core/constants/api_links.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/functions/translate_database.dart';
import 'package:my_store/data/model/product.dart';

class ProductsView extends GetView<ProductsControllerImp> {
  final ProductModel productModel;
  const ProductsView({super.key, required this.productModel});

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
            Expanded(
              child: Card(
                  color: AppColors.homeBackgroundColor,
                  child: Stack(
                    children: [
                      Center(
                        child: Hero(
                          tag: productModel.id!,
                          child: CachedNetworkImage(
                            imageUrl:
                                "${ApiLinks.productsImage}/${productModel.image}",
                            width: 130.w,
                            height: 130.w,
                          ),
                        ),
                      ),
                      GetBuilder<FavoriteController>(
                        builder: (controller) => Positioned(
                            right: 20.w,
                            top: 20.h,
                            child: Icon(
                              controller.favorites['${productModel.id}'] == 1
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Colors.red,
                              size: 25.r,
                            )),
                      ),
                      // rating component
                      Positioned(
                          left: 7.w,
                          bottom: 5.h,
                          child: Row(
                            children: [
                              Text(
                                "69".tr,
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              // if product rated will show yellow stars with count matched to rate and (5 - count) grey stars
                              if (productModel.reviewers != 0)
                                ...List.generate(
                                    productModel.rate!,
                                    (index) => Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 20.r,
                                        )),
                              if (productModel.reviewers != 0)
                                ...List.generate(
                                    5 - productModel.rate!,
                                    (index) => Icon(
                                          Icons.star,
                                          color: Colors.grey,
                                          size: 20.r,
                                        )),
                              // if product did not rate yet will show 5 grey stars
                              if (productModel.reviewers == 0)
                                ...List.generate(
                                    5,
                                    (index) => Icon(
                                          Icons.star,
                                          color: Colors.grey,
                                          size: 20.r,
                                        )),
                            ],
                          ))
                      // end rating component
                    ],
                  )),
            ),
            Text(
              translateDatabase(productModel.nameAr, productModel.name),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // if product has a discount will show old price before discount
                productModel.discount! > 0
                    ? Stack(
                        children: [
                          Text(
                            "${productModel.price} \$",
                            style:
                                TextStyle(fontSize: 14.sp, color: Colors.grey),
                          ),
                          Positioned(
                              top: 8.h,
                              child: Container(
                                height: 0.6.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.black),
                              ))
                        ],
                      )
                    : SizedBox(),
                10.horizontalSpace,
                Text(
                  "${productModel.disPrice!.toPrecision(1)} \$",
                  style: TextStyle(fontSize: 14.sp, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
