import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/address/addresses_controller.dart';
import 'package:my_store/core/constants/app_colors.dart';
import 'package:my_store/data/model/address.dart';

class AddressView extends GetView<AddressesControllerImp> {
  final AddressModel model;
  const AddressView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(model.name!),
        ),
        titleTextStyle: const TextStyle(
          color: Colors.green,
          fontSize: 24,
        ),
        isThreeLine: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "City       : ${model.city}",
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
            Text("Street  : ${model.street}",
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal)),
            Text("Details : ${model.details}",
                style: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.normal))
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                iconSize: 27,
                color: AppColors.homeIconGreyColor,
                onPressed: () {
                  controller.toEditAddress(model.id!, model.name!, model.city!,
                      model.street!, model.details!);
                },
                icon: const Icon(Icons.edit_location_alt_outlined)),
            IconButton(
                iconSize: 27,
                color: AppColors.homeIconGreyColor,
                onPressed: () {
                  controller.deleteAddress(model.id!);
                },
                icon: const Icon(Icons.delete_outline_outlined)),
          ],
        ));
  }
}
