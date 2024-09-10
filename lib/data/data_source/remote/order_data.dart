import 'package:my_store/core/classes/crud.dart';
import 'package:my_store/core/constants/api_links.dart';

class OrderData {
  Crud crud;
  OrderData({required this.crud});

  addOrder(Map data) async {
    var response = await crud.postData(ApiLinks.checkout, data);
    return response.fold((l) => l, (r) => r);
  }

  getOrders(int? userId) async {
    var response = await crud.postData(ApiLinks.orders, {"userId": "$userId"});
    return response.fold((l) => l, (r) => r);
  }

  deleteOrder(int? id) async {
    var response = await crud.postData(ApiLinks.deleteOrder, {"id": "$id"});
    return response.fold((l) => l, (r) => r);
  }

  getOrderProducts(int? orderId) async {
    var response =
        await crud.postData(ApiLinks.orderProducts, {"orderId": "$orderId"});
    return response.fold((l) => l, (r) => r);
  }
}
