import 'package:flutter/material.dart';
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
        title: const Text('Addresses'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.toAddAddress();
        },
        child: const Icon(Icons.add,color: Colors.white,),
      ),
      body: GetBuilder<AddressesControllerImp>(
        builder: (controller) => HandlingDataView(
            requestStatus: controller.requestStatus!,
            widget: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                indent: 20,
                endIndent: 20,
              ),
              itemCount: controller.addresses.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: AddressView(model: controller.addresses[index]),
              ),
            )),
      ),
    );
  }
}
