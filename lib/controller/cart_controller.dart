import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/functions/show_erorr_dialog.dart';
import 'package:my_store/core/functions/show_noInternet_snackbar.dart';
import 'package:my_store/core/functions/show_server_erorr_snackbar.dart';
import 'package:my_store/core/services/app_services.dart';
import 'package:my_store/data/data_source/remote/cart_data.dart';
import 'package:my_store/data/model/cart.dart';
import 'package:my_store/data/model/coupon.dart';

abstract class CartController extends GetxController {
  initialData();
  getProducts();
  increaseQuantity(int id, int productId);
  decreaseQuantity(int id, int productId);
  updateCart(int id, int productId, int quantity);
  deleteFromCart(int id);
  computeSubTotalAndTotal();
  increaseSubTotalAndTotal(int id);
  decreaseSubTotalAndTotal(int id);
  applyCoupon();
  toCheckout();
}

class CartControllerImp extends CartController {
  AppServices services = Get.find();
  int? userId;
  List<CartProductModel> products = [];
  CartData cartData = CartData(crud: Get.find());
  late RequestStatus requestStatus;
  RequestStatus couponRequestStatus = RequestStatus.failure;
  double subTotal = 0;
  int discount = 0;
  double total = 0;
  TextEditingController couponName = TextEditingController();
  CouponModel? coupon;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() async {
    userId = services.preferences.getInt("user_id");
    await getProducts();
    computeSubTotalAndTotal();
  }

  @override
  getProducts() async {
    products.clear();
    requestStatus = RequestStatus.loading;
    update();
    var response = await cartData.getCartProducts(userId!);
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      List data = response['data'];
      products.addAll(data.map((e) => CartProductModel.fromJson(e)));
    }
    update();
  }

  @override
  decreaseQuantity(int id, int productId) {
    products.where((element) => element.id == id).first.quantity =
        products.where((element) => element.id == id).first.quantity! - 1;
    decreaseSubTotalAndTotal(id);
    int quantity =
        products.where((element) => element.id == id).first.quantity!;
    updateCart(id, productId, quantity);
  }

  @override
  increaseQuantity(int id, int productId) {
    products.where((element) => element.id == id).first.quantity =
        products.where((element) => element.id == id).first.quantity! + 1;
    increaseSubTotalAndTotal(id);
    int quantity =
        products.where((element) => element.id == id).first.quantity!;
    updateCart(id, productId, quantity);
  }

  @override
  updateCart(int id, int productId, int quantity) async {
    var response = await cartData.updateProduct(id, productId, quantity);
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      Get.rawSnackbar(messageText: const Text("The changes had saved"));
    }
  }

  @override
  deleteFromCart(int id) {
    products.removeWhere((element) => element.id == id);
    computeSubTotalAndTotal();
    cartData.deleteProduct(id);
  }

  @override
  computeSubTotalAndTotal() {
    total = 0;
    subTotal = 0;
    for (CartProductModel element in products) {
      subTotal += element.totalPrice!;
    }
    total = subTotal - (subTotal * discount / 100);
    update();
  }

  @override
  decreaseSubTotalAndTotal(int id) {
    for (CartProductModel element in products) {
      if (element.id == id) {
        subTotal -= element.disPrice!;
      }
    }
    total = subTotal - (subTotal * discount / 100);
    update();
  }

  @override
  increaseSubTotalAndTotal(int id) {
    for (CartProductModel element in products) {
      if (element.id == id) {
        subTotal += element.disPrice!;
      }
    }
    total = subTotal - (subTotal * discount / 100);
    update();
  }

  @override
  applyCoupon() async {
    if (formKey.currentState!.validate()) {
      couponRequestStatus = RequestStatus.loading;
      update();
      var response = await cartData.getCoupon(couponName.text);
      couponRequestStatus = handlingData(response);
      if (couponRequestStatus == RequestStatus.success) {
        var responseBody = response['data'];
        coupon = CouponModel.fromJson(responseBody);
        discount = coupon!.discount!;
        computeSubTotalAndTotal();
        Get.back();
      }
      if (couponRequestStatus == RequestStatus.failure) {
        showErorrDialog("This coupon is not valid or expired");
      }
      if (couponRequestStatus == RequestStatus.offlineFailure) {
        showNoInternetSnackbar();
      }
      if (couponRequestStatus == RequestStatus.serverFailure) {
        showServerErorrSnackbar();
      }
    }
  }

  @override
  toCheckout() {
    if (products.isEmpty) {
      return Get.snackbar(
          "Erorr", "Please add some products to the cart before");
    }
    Get.toNamed(AppRoutes.checkOut,
        arguments: {"couponId": coupon?.id, "orderPrice": subTotal});
  }
}
