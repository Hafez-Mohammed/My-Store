import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/cart_controller.dart';
import 'package:my_store/core/constants/api_links.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:my_store/core/functions/translate_database.dart';
import 'package:my_store/data/model/cart.dart';

class ProductCard extends StatelessWidget {
  final CartProductModel model;
  const ProductCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
        builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
              height: 120,
              child: Card(
                color: Colors.white,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor:
                              AppColors.onboardingMainColor.withOpacity(0.2),
                          child: CachedNetworkImage(
                            imageUrl:
                                "${ApiLinks.productsImage}/${model.image}",
                            width: 40,
                            height: 40,
                            fit: BoxFit.fill,
                          ),
                        ),
                        title: Text(
                          "${translateDatabase(model.nameAr, model.name)}",
                          style: const TextStyle(fontSize: 14),
                        ),
                        subtitle: Text(
                          "${model.disPrice!.toPrecision(1)}",
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: const Color.fromARGB(255, 236, 236, 236),
                          child: IconButton(
                              onPressed: () {
                                if (model.quantity! > 1) {
                                  controller.decreaseQuantity(
                                      model.id!, model.productId!);
                                }
                              },
                              iconSize: 15,
                              icon: const Icon(Icons.remove)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "${model.quantity}",
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.blue[100],
                          child: IconButton(
                              onPressed: () {
                                controller.increaseQuantity(
                                    model.id!, model.productId!);
                              },
                              iconSize: 15,
                              icon: const Icon(Icons.add)),
                        ),
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          controller.deleteFromCart(model.id!);
                        },
                        color: Colors.red,
                        icon: const Icon(Icons.delete))
                  ],
                ),
              ),
            ));
  }
}
