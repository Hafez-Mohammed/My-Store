import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/functions/show_erorr_dialog.dart';
import 'package:my_store/core/functions/show_noInternet_snackbar.dart';
import 'package:my_store/core/functions/show_server_erorr_snackbar.dart';
import 'package:my_store/core/services/app_services.dart';
import 'package:my_store/data/data_source/remote/order_data.dart';
import 'package:my_store/data/model/order.dart';
import 'package:my_store/data/model/order_details.dart';

class OrderDetailsController extends GetxController {
  AppServices services = Get.find();
  int? userId;
  RequestStatus requestStatus = RequestStatus.loading;
  RequestStatus? requestStatus2;
  OrderData orderData = OrderData(crud: Get.find());
  List<OrderDetailsModel> orderProducts = [];
  late OrderModel orderModel;
  int rate = 0;

  initialData() {
    userId = services.preferences.getInt("user_id");
    orderModel = Get.arguments['orderModel'];
    getOrderProducts();
  }

  getOrderProducts() async {
    requestStatus == RequestStatus.loading;
    update();
    var response = await orderData.getOrderProducts(orderModel.id);
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      List data = response['data'];
      orderProducts.addAll(data.map((e) => OrderDetailsModel.fromJson(e)));
    }
    update();
  }

  changeRate(int index) {
    rate = index + 1;
    update();
  }

  resetRate() {
    rate = 0;
    update();
  }

  ratingProduct(int productId, int rate) async {
    requestStatus2 = RequestStatus.loading;
    update();
    var response = await orderData.insertProductRate(userId, productId, rate);
    requestStatus2 = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      Get.back();
    }
    if (requestStatus == RequestStatus.failure) {
      Get.back();
      Get.snackbar("Erorr", "Something went wrong.. please try again");
    }
    if (requestStatus == RequestStatus.offlineFailure) {
      Get.back();
      showNoInternetSnackbar();
    }
    if (requestStatus == RequestStatus.serverFailure) {
      Get.back();
      showServerErorrSnackbar();
    }
    update();
  }

  cardCheckout() {
    Get.to(PaypalCheckout(
      sandboxMode: true,
      clientId: "CLIENT_ID",
      secretKey: "SECRET_KEY",
      returnURL: "RETURN_URL",
      cancelURL: "CANCEL_URL",
      transactions: [
        {
          "amount": {
            "total": orderModel.totalPrice,
            "currency": "USD",
            "details": {
              "subtotal": orderModel.price,
              "shipping": orderModel.deliveryCost,
              "shipping_discount": 0
            }
          },
          "description": "The payment transaction description.",
          "item_list": {
            "items": List.generate(
                orderProducts.length,
                (index) => {
                      "name": orderProducts[index].name,
                      "quantity": orderProducts[index].quantity,
                      "price": orderProducts[index].disPrice,
                      "currency": "USD"
                    })
            // shipping address is Optional
            // "shipping_address": {
            //   "recipient_name": "Raman Singh",
            //   "line1": "Delhi",
            //   "line2": "",
            //   "city": "Delhi",
            //   "country_code": "IN",
            //   "postal_code": "11001",
            //   "phone": "+00000000",
            //   "state": "Texas"
            // },
          }
        }
      ],
      note: "PAYMENT_NOTE",
      onSuccess: (Map params) async {
        print("onSuccess: $params");
      },
      onError: (error) {
        // print("onError: $error");
        Get.back();
        showErorrDialog(error);
      },
      onCancel: () {
        Get.back();
      },
    ));
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
