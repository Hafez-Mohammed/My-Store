import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/core/classes/request_status.dart';
import 'package:my_store/core/constants/app_routes.dart';
import 'package:my_store/core/functions/handling_data.dart';
import 'package:my_store/core/functions/show_noInternet_snackbar.dart';
import 'package:my_store/core/functions/show_server_erorr_snackbar.dart';
import 'package:my_store/core/services/app_services.dart';
import 'package:my_store/data/data_source/remote/address_data.dart';

class AddAddressController extends GetxController {
  AppServices services = Get.find();
  int? userId;
  late GlobalKey<FormState> formKey;
  FocusNode? nameFocusNode;
  FocusNode? cityFocusNode;
  FocusNode? streetFocusNode;
  FocusNode? detailsFocusNode;
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  TextEditingController? details;
  AddressData addressData = AddressData(crud: Get.find());
  RequestStatus? requestStatus;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  initialData() {
    formKey = GlobalKey();
    nameFocusNode = FocusNode();
    cityFocusNode = FocusNode();
    streetFocusNode = FocusNode();
    detailsFocusNode = FocusNode();
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    details = TextEditingController();
    userId = services.preferences.getInt("user_id");
  }

  addAddress() async {
    if (formKey.currentState!.validate()) {
      requestStatus = RequestStatus.loading;
      update();
      var response = await addressData.addAddress(
          userId!, name!.text, city!.text, street!.text, details!.text);
      requestStatus = handlingData(response);
      update();
      if (requestStatus == RequestStatus.success) {
        Get.offNamedUntil(AppRoutes.addresses, ModalRoute.withName(AppRoutes.homeScreen));
      }
       if (requestStatus == RequestStatus.failure) {
      Get.snackbar("Erorr", "Something went wrong!");
    }
    if (requestStatus == RequestStatus.offlineFailure) {
      showNoInternetSnackbar();
    }
    if (requestStatus == RequestStatus.serverFailure) {
      showServerErorrSnackbar();
    }
    }
  }
}
