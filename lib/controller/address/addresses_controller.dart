import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/services/app_services.dart';
import 'package:my_store/data/data_source/remote/address_data.dart';
import 'package:my_store/data/model/address.dart';

abstract class AddressesController extends GetxController {
  initialData();
  getAddresses();
  toAddAddress();
  toEditAddress(
      int id, String name, String city, String street, String details);
  deleteAddress(int id);
}

class AddressesControllerImp extends AddressesController {
  AddressData addressData = AddressData(crud: Get.find());
  AppServices services = Get.find();
  int? userId;
  RequestStatus? requestStatus;
  List<AddressModel> addresses = [];
  @override
  void onInit() {
    initialData();
    super.onInit();
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
    await getAddresses();
  }

  @override
  toAddAddress() {
    Get.toNamed(AppRoutes.addAddress);
  }

  @override
  toEditAddress(
      int id, String name, String city, String street, String details) {
    Get.toNamed(AppRoutes.editAddress, arguments: {
      "id": id,
      "name": name,
      "city": city,
      "street": street,
      "details": details
    });
  }

  @override
  deleteAddress(int id) {
    addresses.removeWhere((element) => element.id == id);
    update();
    addressData.deleteAddress(id);
  }
}
