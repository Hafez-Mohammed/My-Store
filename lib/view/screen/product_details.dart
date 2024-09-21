import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              height: 180.h,
              color: AppColors.homeBackgroundColor,
              child: const ImageStack()),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // product name
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10).h,
                  child: Text(
                    controller.productModel.name!,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: Colors.black, fontSize: 22.sp),
                  ),
                ),

                // Product description
                Text(
                  controller.productModel.description!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.normal, height: 1.3.h),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: RatingComponent(
                    reviewers: controller.productModel.reviewers,
                    rate: controller.productModel.rate,
                  ),
                ),

                // Product price
                Padding(
                    padding: EdgeInsets.only(left: 10.w),
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
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.normal),
                          ),
                        ),
                        GetBuilder<FavoriteController>(
                          builder: (favController) => IconButton(
                              onPressed: () {
                                // when user tap on favorite switch state between favorite and not favorite
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
                              iconSize: 30.r,
                              icon: Icon(
                                  // check if product exists in user favorites list to show outlined favorite icon or colored icon
                                  favController.favorites[
                                              '${controller.productModel.id}'] ==
                                          1
                                      ? Icons.favorite
                                      : Icons.favorite_border_outlined)),
                        )
                      ],
                    )),

                const Divider(),
                const ColorsComponent(),
                const SizeComponent(),
                const QuantityComponent(),
                5.verticalSpace,
                Center(
                    child: CustomButton(
                  text: "Add to Cart",
                  onPressed: () {
                    controller.addToCart();
                  },
                )),
                10.verticalSpace,
              ],
            ),
          )
        ],
      ),
    );
  }
}
