import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/functions/handling_data.dart';
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

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
