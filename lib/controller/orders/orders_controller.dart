import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/services/app_services.dart';
import 'package:my_store/data/data_source/remote/order_data.dart';
import 'package:my_store/data/model/order.dart';

class OrdersController extends GetxController {
  AppServices services = Get.find();
  int? userId;
  RequestStatus requestStatus = RequestStatus.loading;
  OrderData orderData = OrderData(crud: Get.find());
  List<OrderModel> orders = [];

  initialData() {
    userId = services.preferences.getInt("user_id");
    getOrders();
  }

  getOrders() async {
    orders.clear();
    requestStatus == RequestStatus.loading;
    update();
    var response = await orderData.getOrders(userId);
    requestStatus = handlingData(response);
    if (requestStatus == RequestStatus.success) {
      List data = response['data'];
      orders.addAll(data.map((e) => OrderModel.fromJson(e)));
    }
    update();
  }

  cancelOrder(int id) async {
    orders.removeWhere((element) => element.id == id);
    update();
    orderData.deleteOrder(id);
  }

  goToDetails(OrderModel order) async {
    Get.toNamed(AppRoutes.orderDetails, arguments: {"orderModel": order});
  }

  refreshPage() {
    getOrders();
  }

  String getPaymentMethod(int? value) {
    if (value == 0) {
      return "Cash";
    } else {
      return "Credit Card";
    }
  }

  String getReceivingType(int? value) {
    if (value == 0) {
      return "Drive Thru";
    } else {
      return "Delivery";
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
