import 'package:my_store/core/classes/crud.dart';
import 'package:my_store/core/constants/api_links.dart';

class CartData {
  Crud crud;
  CartData({required this.crud});

  getCartProducts(int userId) async {
    var response =
        await crud.postData(ApiLinks.cartProducts, {"userId": "$userId"});
    return response.fold((l) => l, (r) => r);
  }

  addProduct(int userId, int productId, int quantity, String? color,
      String? size) async {
    var response = await crud.postData(ApiLinks.addCart, {
      "userId": "$userId",
      "productId": "$productId",
      "quantity": "$quantity",
      "color": color,
      "size": size
    });
    return response.fold((l) => l, (r) => r);
  }

  updateProduct(int id, int productId, int quantity) async {
    var response = await crud.postData(ApiLinks.updateCart,
        {"id": "$id", "productId": "$productId", "quantity": "$quantity"});
    return response.fold((l) => l, (r) => r);
  }

  deleteProduct(int id) async {
    var response = await crud.postData(ApiLinks.deleteCart, {"id": "$id"});
    return response.fold((l) => l, (r) => r);
  }

  getCoupon(String name) async {
    var response = await crud.postData(ApiLinks.getCoupon, {"name": name});
    return response.fold((l) => l, (r) => r);
  }
}
