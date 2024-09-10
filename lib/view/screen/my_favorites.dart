import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/my_favorites_controller.dart';
import 'package:my_store/core/classes/handling_data_view.dart';
import 'package:my_store/view/widget/my_favorites/favorite_view.dart';

class MyFavorites extends StatelessWidget {
  const MyFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoritesController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My favorites',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: GetBuilder<MyFavoritesController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: HandlingDataView(
              requestStatus: controller.requestStatus,
              widget: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.6),
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) => FavoriteProductsView(
                        productModel: controller.products[index],
                      ))),
        ),
      ),
    );
  }
}
