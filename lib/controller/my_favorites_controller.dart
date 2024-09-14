import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/functions/show_erorr_dialog.dart';
import 'package:my_store/core/functions/show_noInternet_snackbar.dart';
import 'package:my_store/core/functions/show_server_erorr_snackbar.dart';
import 'package:my_store/core/services/app_services.dart';
import 'package:my_store/data/data_source/remote/my_favorites.dart';
import 'package:my_store/data/model/favorite.dart';
import 'package:my_store/data/model/product.dart';

class MyFavoritesController extends GetxController {
  AppServices services = Get.find();
  List<FavoriteProductModel> products = [];
  MyFavoritesData myFavoritesData = MyFavoritesData(crud: Get.find());
  late RequestStatus requestStatus;

  getProducts() async {
    requestStatus = RequestStatus.loading;
    update();
    var response =
        await myFavoritesData.getData(services.preferences.getInt("user_id")!);
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      List data = response['data'];
      products.addAll(data.map((e) => FavoriteProductModel.fromJson(e)));
    }
    update();
  }

  deleteFromFavorite(int id) async {
    var response = await myFavoritesData.delete(id);
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      products.removeWhere((element) => element.favId == id);
      update();
      Get.rawSnackbar(
          messageText: const Text("The product is removed from favorites"));
    }
    if (requestStatus == RequestStatus.failure) {
      showErorrDialog("55".tr);
    }
    if (requestStatus == RequestStatus.offlineFailure) {
      showNoInternetSnackbar();
    }
    if (requestStatus == RequestStatus.serverFailure) {
      showServerErorrSnackbar();
    }
  }

  toDetails(FavoriteProductModel model) {
    ProductModel productModel = ProductModel(
        id: model.id,
        catId: model.catId,
        name: model.name,
        nameAr: model.nameAr,
        image: model.image,
        description: model.description,
        descriptionAr: model.descriptionAr,
        price: model.price,
        isfavorite: 1,
        disPrice: model.disPrice,
        reviewers: model.reviewers,
        rate: model.rate,
        hidden: model.hidden,
        date: model.date,
        discount: model.discount,
        quantity: model.quantity);
    Get.toNamed(AppRoutes.productDetails, arguments: {"model": productModel});
  }

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }
}
