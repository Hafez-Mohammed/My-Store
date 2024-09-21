import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/address/addresses_controller.dart';
import 'package:my_store/core/classes/handling_data_view.dart';
import 'package:my_store/view/widget/address/address_view.dart';

class Addresses extends StatelessWidget {
  const Addresses({super.key});

  @override
  Widget build(BuildContext context) {
    AddressesControllerImp controller = Get.put(AddressesControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Addresses'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.toAddAddress();
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: GetBuilder<AddressesControllerImp>(
        builder: (controller) => HandlingDataView(
            requestStatus: controller.requestStatus!,
            widget: ListView.separated(
              separatorBuilder: (context, index) =>  Divider(
                indent: 20.w,
                endIndent: 20.w,
              ),
              itemCount: controller.addresses.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10).r,
                child: AddressView(model: controller.addresses[index]),
              ),
            )),
      ),
    );
  }
}
