import 'package:my_store/core/classes/crud.dart';
import 'package:my_store/core/constants/api_links.dart';

class AddressData {
  Crud crud;
  AddressData({required this.crud});

  getUserAddresses(int userId) async {
    var response =
        await crud.postData(ApiLinks.addresses, {"userId": "$userId"});
    return response.fold((l) => l, (r) => r);
  }

  addAddress(int userId, String name, String city, String street,
      String details) async {
    var response = await crud.postData(ApiLinks.addAddress, {
      "userId": "$userId",
      "name": name,
      "city": city,
      "street": street,
      "details": details,
    });
    return response.fold((l) => l, (r) => r);
  }

  updateAddress(
      int id, String name, String city, String street, String details) async {
    var response = await crud.postData(ApiLinks.updateAddress, {
      "id": "$id",
      "name": name,
      "city": city,
      "street": street,
      "details": details
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(int id) async {
    var response = await crud.postData(ApiLinks.deleteAddress, {"id": "$id"});
    return response.fold((l) => l, (r) => r);
  }
}
