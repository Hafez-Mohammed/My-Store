// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/favorite_controller.dart';
import 'package:my_store/controller/product_details_controller.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:my_store/view/widget/product_details/colors_component.dart';
import 'package:my_store/view/widget/product_details/custom_button.dart';
import 'package:my_store/view/widget/product_details/image_stack.dart';
import 'package:my_store/view/widget/product_details/quantity_component.dart';
import 'package:my_store/view/widget/product_details/raiting_component.dart';
import 'package:my_store/view/widget/product_details/size_component.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    return Scaffold(
      body: ListView(
        children: [
          // Product image
          Container(
              height: 180,
              color: AppColors.homeBackgroundColor,
              child: ImageStack()),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // product name
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    controller.productModel.name!,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: Colors.black, fontSize: 22),
                  ),
                ),

                // Product description
                Text(
                  controller.productModel.description!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.normal, height: 1.3),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: RatingComponent(
                    reviewers: controller.productModel.reviewers,
                    rate: controller.productModel.rate,
                  ),
                ),

                // Product price
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Text(
                            "${controller.productModel.disPrice!.toPrecision(1)} \$",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.normal),
                          ),
                        ),
                        GetBuilder<FavoriteController>(
                          builder: (favController) => IconButton(
                              onPressed: () {
                                if (favController.favorites[
                                        '${controller.productModel.id}'] ==
                                    1) {
                                  favController.deleteFromFavorite(
                                      controller.productModel.id!);
                                } else {
                                  favController.addToFavorite(
                                      controller.productModel.id!);
                                }
                              },
                              color: Colors.red,
                              iconSize: 30,
                              icon: Icon(favController.favorites[
                                          '${controller.productModel.id}'] ==
                                      1
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined)),
                        )
                      ],
                    )),

                Divider(),
                ColorsComponent(),
                SizeComponent(),
                QuantityComponent(),
                SizedBox(
                  height: 5,
                ),
                Center(
                    child: CustomButton(
                  text: "Add to Cart",
                  onPressed: () {
                    controller.addToCart();
                  },
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
