import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/home_page_controller.dart';
import 'package:my_store/core/constants/api_links.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:my_store/core/functions/translate_database.dart';
import 'package:my_store/data/model/offer.dart';

class HomeOffersList extends GetView<HomePageControllerImp> {
  const HomeOffersList({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterCarousel(
        options: CarouselOptions(
            height: 180.h,
            showIndicator: false,
            autoPlay: true,
            floatingIndicator: false,
            enlargeCenterPage: true),
        items: List.generate(
            controller.offers.length,
            (index) => OfferCard(
                offerModel: OfferModel.fromJson(controller.offers[index]))));
  }
}

class OfferCard extends StatelessWidget {
  final OfferModel offerModel;
  const OfferCard({super.key, required this.offerModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.homeBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 20),
            width: 100.w,
            height: 180.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  translateDatabase(offerModel.titleAr, offerModel.title),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  translateDatabase(offerModel.bodyAr, offerModel.body),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(fontSize: 12.sp),
                ),
                5.verticalSpace,
                SizedBox(
                  height: 30.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => AppColors.onboardingMainColor),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5).r))),
                    child: Text(
                      "66".tr,
                      style: TextStyle(fontSize: 11.sp, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          CachedNetworkImage(
            imageUrl: "${ApiLinks.offersImage}/${offerModel.image}",
            width: 180,
            height: 180,
          )
        ],
      ),
    );
  }
}
