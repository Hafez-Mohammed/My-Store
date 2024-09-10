import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/product_details_controller.dart';
import 'package:my_store/core/constants/api_links.dart';

class ImageStack extends GetView<ProductDetailsControllerImp> {
  const ImageStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Hero(
            tag: controller.productModel.id!,
            child: CachedNetworkImage(
              imageUrl:
                  "${ApiLinks.productsImage}/${controller.productModel.image}",
              width: Get.width / 1.9,
            ),
          ),
        ),
        Positioned(
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.arrow_back_rounded)))
      ],
    );
  }
}
