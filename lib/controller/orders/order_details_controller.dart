import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/data/data_source/remote/order_data.dart';
import 'package:my_store/data/model/order.dart';
import 'package:my_store/data/model/order_details.dart';

class OrderDetailsController extends GetxController {
  RequestStatus requestStatus = RequestStatus.loading;
  OrderData orderData = OrderData(crud: Get.find());
  List<OrderDetailsModel> orderProducts = [];
  late OrderModel orderModel;

  initialData() {
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
  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
