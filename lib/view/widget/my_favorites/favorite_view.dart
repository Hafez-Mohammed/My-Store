// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/my_favorites_controller.dart';
import 'package:my_store/core/constants/api_links.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_store/core/functions/translate_database.dart';
import 'package:my_store/data/model/favorite.dart';

class FavoriteProductsView extends GetView<MyFavoritesController> {
  final FavoriteProductModel productModel;
  const FavoriteProductsView({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.toDetails(productModel);
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
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "${productModel.price} \$",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.sp, color: Colors.red),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GetBuilder<MyFavoritesController>(
                      builder: (controller) => IconButton(
                          onPressed: () {
                            controller.deleteFromFavorite(productModel.favId!);
                          },
                          iconSize: 30.r,
                          color: AppColors.homeIconGreyColor,
                          icon: Icon(Icons.remove_circle_outline_outlined))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
