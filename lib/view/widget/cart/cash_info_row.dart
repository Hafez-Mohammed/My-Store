import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_store/controller/cart_controller.dart';

class CashInfoRow extends StatelessWidget {
  const CashInfoRow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: Row(
              children: [
                Text(
                  "Subtotal:",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.grey),
                ),
                10.horizontalSpace,
                Text(
                  "${controller.subTotal}\$",
                  style: TextStyle(color: Colors.black, fontSize: 16.sp),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                "Discount:",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: Colors.grey),
              ),
              10.horizontalSpace,
              Text("${controller.discount} %",
                  style: TextStyle(color: Colors.black, fontSize: 16.sp)),
            ],
          ),
        ],
      ),
    );
  }
}
