import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/functions/show_erorr_dialog.dart';
import 'package:my_store/core/functions/show_noInternet_snackbar.dart';
import 'package:my_store/core/functions/show_server_erorr_snackbar.dart';
import 'package:my_store/core/services/app_services.dart';
import 'package:my_store/data/data_source/remote/favorite_data.dart';

class FavoriteController extends GetxController {
  Map favorites = {};
  FavoriteData favoriteData = FavoriteData(crud: Get.find());
  late RequestStatus requestStatus;
  AppServices services = Get.find();

  setFavorite(productId, isfavorite) {
    favorites['$productId'] = isfavorite;
    update();
  }

  addToFavorite(int productId) async {
    var response = await favoriteData.add(
        services.preferences.getInt("user_id")!, productId);
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      setFavorite(productId, 1);
      Get.rawSnackbar(
          messageText: const Text("The product is added to favorites"));
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

  deleteFromFavorite(int productId) async {
    var response = await favoriteData.delete(
        services.preferences.getInt("user_id")!, productId);
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      setFavorite(productId, 0);
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
}
