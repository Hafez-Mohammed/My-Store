import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/functions/show_erorr_dialog.dart';
import 'package:my_store/core/functions/show_noInternet_snackbar.dart';
import 'package:my_store/core/functions/show_server_erorr_snackbar.dart';
import 'package:my_store/core/functions/translate_database.dart';
import 'package:my_store/core/services/app_services.dart';
import 'package:my_store/data/data_source/remote/cart_data.dart';
import 'package:my_store/data/data_source/remote/products_data.dart';
import 'package:my_store/data/model/product.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();
  getSpecifications();
  changeColor(int val);
  changeSize(int val);
  increaseQuantity();
  decreaseQuantity();
  addToCart();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  AppServices services = Get.find();
  int? userId;
  ProductsData productsData = ProductsData(crud: Get.find());
  CartData cartData = CartData(crud: Get.find());
  late RequestStatus requestStatus;
  late ProductModel productModel;
  int quantity = 0;
  int? selectedColorIndex;
  int? selectedSizeIndex;
  Map<String, Color> standardColors = {
    "red": Colors.red,
    "black": Colors.black,
    "white": Colors.white,
    "yellow": Colors.yellow,
    "grey": Colors.grey,
    "blue": Colors.blue
  };
  List<String> color = [];
  List<String> size = [];
  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() async {
    productModel = Get.arguments['model'];
    userId = services.preferences.getInt("user_id");
    await getSpecifications();
  }

  @override
  changeColor(val) {
    selectedColorIndex = val;
    update();
  }

  @override
  changeSize(int val) {
    selectedSizeIndex = val;
    update();
  }

  @override
  decreaseQuantity() {
    if (quantity > 0) {
      quantity--;
      update();
    }
  }

  @override
  increaseQuantity() {
    quantity++;
    update();
  }

  @override
  getSpecifications() async {
    requestStatus = RequestStatus.loading;
    update();
    var response = await productsData.getSpecifications(productModel.id!);
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      List colors = response['colors'];
      List sizes = response['sizes'];
      color.addAll(colors.map((e) => e['color']));
      size.addAll(sizes.map((e) => e['size']));
    }
    update();
  }

  @override
  addToCart() async{
    String selectedColor = "";
    String selectedSize = "";
    if (color.isNotEmpty) {
      if (selectedColorIndex != null) {
        selectedColor = color[selectedColorIndex!];
      } else {
       return showErorrDialog("Please select product color");
      }
    }
    if (size.isNotEmpty) {
      if (selectedSizeIndex != null) {
        selectedSize = size[selectedSizeIndex!];
      } else {
       return showErorrDialog("Please select product size");
      }
    }
    if (quantity == 0) {
      return showErorrDialog("Quantity can not be zero");
    }
    var response = await cartData.addProduct(
        userId!, productModel.id!, quantity, selectedColor, selectedSize);
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      Get.rawSnackbar(
          messageText: const Text("The product is added to the cart"));
    }
    if (requestStatus == RequestStatus.failure) {
      showErorrDialog(
          translateDatabase(response['message_ar'], response['message']));
    }
    if (requestStatus == RequestStatus.offlineFailure) {
      showNoInternetSnackbar();
    }
    if (requestStatus == RequestStatus.serverFailure) {
      showServerErorrSnackbar();
    }
  }
}
