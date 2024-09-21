import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/home_page_controller.dart';
import 'package:my_store/core/constants/api_links.dart';
import 'package:my_store/core/functions/translate_database.dart';
import 'package:my_store/data/model/category.dart';

class CategoriesList extends GetView<HomePageControllerImp> {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => InkWell(
              onTap: () {
                controller.goToProducts(controller.categories, index);
              },
              child: SizedBox(
                width: 90.w,
                child: Category(
                    categoryModel:
                        CategoryModel.fromJson(controller.categories[index])),
              ),
            ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length);
  }
}

class Category extends StatelessWidget {
  final CategoryModel categoryModel;
  const Category({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
              color: const Color.fromRGBO(244, 246, 248, 1),
              borderRadius: BorderRadius.circular(18).r,
              border: const Border(
                  top: BorderSide(width: 0.5, color: Colors.black),
                  left: BorderSide(width: 0.5, color: Colors.black),
                  right: BorderSide(width: 0.5, color: Colors.black),
                  bottom: BorderSide(width: 3, color: Colors.black))),
          child: CachedNetworkImage(
            imageUrl: "${ApiLinks.categoriesImage}/${categoryModel.image}",
            width: 50.w,
            height: 70.h,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          translateDatabase(categoryModel.nameAr, categoryModel.name),
          style:  TextStyle(
              fontSize: 14.sp, color: Colors.black, fontWeight: FontWeight.normal),
        )
      ],
    );
  }
}
