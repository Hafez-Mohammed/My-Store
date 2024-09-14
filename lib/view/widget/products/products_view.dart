// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
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
                            width: 130,
                            height: 130,
                          ),
                        ),
                      ),
                      GetBuilder<FavoriteController>(
                        builder: (controller) => Positioned(
                            right: 20,
                            top: 20,
                            child: Icon(
                              controller.favorites['${productModel.id}'] == 1
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Colors.red,
                              size: 25,
                            )),
                      ),
                      Positioned(
                          left: 7,
                          bottom: 5,
                          child: Row(
                            children: [
                              Text(
                                "69".tr,
                                style: TextStyle(fontSize: 14),
                              ),
                              if (productModel.reviewers != 0)
                                ...List.generate(
                                    productModel.rate!,
                                    (index) => Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                          size: 20,
                                        )),
                              if (productModel.reviewers != 0)
                                ...List.generate(
                                    5 - productModel.rate!,
                                    (index) => Icon(
                                          Icons.star,
                                          color: Colors.grey,
                                          size: 20,
                                        )),
                              if (productModel.reviewers == 0)
                                ...List.generate(
                                    5,
                                    (index) => Icon(
                                          Icons.star,
                                          color: Colors.grey,
                                          size: 20,
                                        )),
                            ],
                          ))
                    ],
                  )),
            ),
            Text(
              translateDatabase(productModel.nameAr, productModel.name),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                productModel.discount! > 0
                    ? Stack(
                        children: [
                          Text(
                            "${productModel.price} \$",
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey),
                          ),
                          Positioned(
                              top: 8,
                              child: Container(
                                height: 0.6,
                                width: 100,
                                decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.black),
                              ))
                        ],
                      )
                    : SizedBox(),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "${productModel.disPrice!.toPrecision(1)} \$",
                  style: const TextStyle(fontSize: 14, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
