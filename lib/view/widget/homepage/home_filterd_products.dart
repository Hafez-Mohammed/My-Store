import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.9, crossAxisCount: 2),
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
                    width: 140,
                    height: 120,
                  ),
                  Positioned(
                      top: 5,
                      left: 5,
                      child: Text(
                        "${productModel.discount} %",
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      ))
                ],
              ),
            ),
            Text(
              translateDatabase(productModel.nameAr, productModel.name),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
            Text(
              "${productModel.disPrice!.toPrecision(1)} \$",
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
