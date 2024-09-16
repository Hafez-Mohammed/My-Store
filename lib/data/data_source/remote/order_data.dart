import 'package:my_store/core/classes/crud.dart';
import 'package:my_store/core/constants/api_links.dart';

class OrderData {
  Crud crud;
  OrderData({required this.crud});

  addOrder(Map data) async {
    var response = await crud.postData(ApiLinks.checkout, data);
    return response.fold((l) => l, (r) => r);
  }

  getOrders(int? userId, int limit, int page) async {
    var response = await crud.postData(ApiLinks.orders,
        {"userId": "$userId", "limit": "$limit", "page": "$page"});
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

  insertProductRate(int? userId, int? productId, int rate) async {
    var response = await crud.postData(ApiLinks.ratingProduct,
        {"userId": "$userId", "productId": "$productId", "rate": "$rate"});
    return response.fold((l) => l, (r) => r);
  }
}
