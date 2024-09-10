import 'package:my_store/core/classes/crud.dart';
import 'package:my_store/core/constants/api_links.dart';

class ProductsData {
  Crud crud;
  ProductsData({required this.crud});

  getData(int catId, int userId) async {
    var response = await crud
        .postData(ApiLinks.products, {"catId": "$catId", "userId": "$userId"});
    return response.fold((l) => l, (r) => r);
  }

  getSpecifications(int productId) async {
    var response = await crud
        .postData(ApiLinks.productSpecification, {"productId": "$productId"});
    return response.fold((l) => l, (r) => r);
  }
}
