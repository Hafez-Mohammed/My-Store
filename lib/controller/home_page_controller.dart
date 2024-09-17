import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/services/app_services.dart';
import 'package:my_store/data/data_source/remote/home.dart';

abstract class HomePageController extends GetxController {
  initialData();
  getData();
  refreshPage();
  goToProducts(List categoriesList, int selectedCat);
  goToNotifications();
}

class HomePageControllerImp extends HomePageController {
  AppServices services = Get.find();
  String? userName;
  int? userId;
  HomeData homeData = HomeData(crud: Get.find());
  late RequestStatus requestStatus;
  TextEditingController searchText = TextEditingController();

  List categories = [];
  List offers = [];
  List products = [];
  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }

  @override
  initialData() {
    userId = services.preferences.getInt("user_id");
    userName = services.preferences.getString("username");
  }

  @override
  getData() async {
    requestStatus = RequestStatus.loading;
    update();
    var response = await homeData.getData();
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      categories.addAll(response['categories']);
      offers.addAll(response['offers']);
      products.addAll(response['products']);
    }
    update();
  }

  @override
  goToProducts(List categoriesList, int selectedCat) {
    Get.toNamed(AppRoutes.products, arguments: {
      "categoriesList": categoriesList,
      "selectedCat": selectedCat
    });
  }

  @override
  goToNotifications() {
    Get.toNamed(AppRoutes.notifications);
  }

  @override
  void onClose() {
    searchText.dispose();
    super.onClose();
  }

  @override
  refreshPage() async {
    categories.clear();
    offers.clear();
    products.clear();
    await getData();
  }
}
