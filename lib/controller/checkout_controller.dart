import 'package:get/get.dart';
import 'package:my_store/controller/cart_controller.dart';
import 'package:my_store/controller/home_screen_controller.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/functions/show_erorr_dialog.dart';
import 'package:my_store/core/functions/show_noInternet_snackbar.dart';
import 'package:my_store/core/functions/show_server_erorr_snackbar.dart';
import 'package:my_store/core/services/app_services.dart';
import 'package:my_store/data/data_source/remote/address_data.dart';
import 'package:my_store/data/data_source/remote/order_data.dart';
import 'package:my_store/data/model/address.dart';

abstract class CheckoutController extends GetxController {
  initialData();
  choosePaymentMethod(String method);
  chooseReceivingType(String type);
  chooseAddress(AddressModel address);
  getAddresses();
  checkout();
}

class CheckoutControllerImp extends CheckoutController {
  String? paymentMethod;
  String? receivingType;
  AddressModel? deliveryAddress;
  AddressData addressData = AddressData(crud: Get.find());
  OrderData orderData = OrderData(crud: Get.find());
  List<AddressModel> addresses = [];
  AppServices services = Get.find();
  int? userId;
  RequestStatus? requestStatus;
  int? couponId;
  double? orderPrice;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  chooseAddress(AddressModel address) {
    deliveryAddress = address;
    update();
  }

  @override
  choosePaymentMethod(String method) {
    paymentMethod = method;
    update();
  }

  @override
  chooseReceivingType(String type) {
    receivingType = type;
    update();
  }

  @override
  getAddresses() async {
    requestStatus = RequestStatus.loading;
    update();
    var response = await addressData.getUserAddresses(userId!);
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      List responseBody = response['data'];
      addresses.addAll(responseBody.map((e) => AddressModel.fromJson(e)));
    }
    update();
  }

  @override
  initialData() async {
    userId = services.preferences.getInt("user_id");
    couponId = Get.arguments["couponId"];
    orderPrice = Get.arguments["orderPrice"];
    await getAddresses();
  }

  @override
  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Erorr", "Please select payment method");
    }
    if (receivingType == null) {
      return Get.snackbar("Erorr", "Please select receiving type");
    }
    if (receivingType == "Delivery" && deliveryAddress == null) {
      return Get.snackbar("Erorr", "Please select delivery address");
    }
    Map data = {
      "userId": userId.toString(),
      "receivingTtype": receivingType == "Delivery" ? "1" : "0",
      "paymentMethod": paymentMethod == "Cash" ? "0" : "1",
      "deliveryAddress":
          deliveryAddress != null ? deliveryAddress!.id.toString() : "0",
      "couponId": couponId != null ? couponId.toString() : "0",
      "orderPrice": orderPrice.toString()
    };
    requestStatus = RequestStatus.loading;
    update();
    var response = await orderData.addOrder(data);
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      HomeScreenControllerImp homeScreenControllerImp = Get.find();
      Get.back();
      homeScreenControllerImp.changePage(0);
      Get.snackbar("Success", "Your order is recorded");
    }
    if (requestStatus == RequestStatus.failure) {
      showErorrDialog("Something went wrong");
    }
    if (requestStatus == RequestStatus.offlineFailure) {
      showNoInternetSnackbar();
    }
    if (requestStatus == RequestStatus.serverFailure) {
      showServerErorrSnackbar();
    }
  }
}
