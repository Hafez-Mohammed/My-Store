import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          padding: EdgeInsets.only(bottom: 10.h),
          child: Text(model.name!),
        ),
        titleTextStyle: TextStyle(
          color: Colors.green,
          fontSize: 24.sp,
        ),
        isThreeLine: true,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "City       : ${model.city}",
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal),
            ),
            Text("Street  : ${model.street}",
                style:
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal)),
            Text("Details : ${model.details}",
                style:
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal))
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                iconSize: 27.r,
                color: AppColors.homeIconGreyColor,
                onPressed: () {
                  controller.toEditAddress(model.id!, model.name!, model.city!,
                      model.street!, model.details!);
                },
                icon: const Icon(Icons.edit_location_alt_outlined)),
            IconButton(
                iconSize: 27.r,
                color: AppColors.homeIconGreyColor,
                onPressed: () {
                  controller.deleteAddress(model.id!);
                },
                icon: const Icon(Icons.delete_outline_outlined)),
          ],
        ));
  }
}
