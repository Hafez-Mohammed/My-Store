import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/services/app_services.dart';
import 'package:my_store/data/data_source/remote/products_data.dart';
import 'package:my_store/data/model/product.dart';

abstract class ProductsController extends GetxController {
  initialData();
  getProducts();
  filterProducts(int catIndex);
  search(String text);
}

class ProductsControllerImp extends ProductsController {
  AppServices services = Get.find();
  TextEditingController searchText = TextEditingController();
  bool isSearch = false;
  List categories = [];
  int? selectedCat;
  int? catId;
  int? userId;
  List<ProductModel> products = [];
  List<ProductModel> searchProducts = [];
  ProductsData productsData = ProductsData(crud: Get.find());
  late RequestStatus requestStatus;
  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() {
    categories = Get.arguments['categoriesList'];
    selectedCat = Get.arguments['selectedCat'];
    catId = categories[selectedCat!]['id'];
    userId = services.preferences.getInt("user_id");
    getProducts();
  }

  @override
  getProducts() async {
    products.clear();
    requestStatus = RequestStatus.loading;
    update();
    var response = await productsData.getData(catId!, userId!);
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      List responseBody = response['data'];
      products.addAll(responseBody.map((e) => ProductModel.fromJson(e)));
    }
    update();
  }

  @override
  filterProducts(int catIndex) async {
    catId = categories[catIndex]['id'];
    await getProducts();
  }

  @override
  search(String text) {
    if (text.isNotEmpty) {
      searchProducts.clear();
      for (ProductModel product in products) {
        if (product.name!.isCaseInsensitiveContains(text) ||
            product.nameAr!.isCaseInsensitiveContains(text)) {
          searchProducts.add(product);
        }
      }
      isSearch = true;
      
    } else {
      isSearch = false;
    }
    update();
  }
}
