import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Text(
                  "Subtotal:",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.grey),
                ),
                SizedBox(width: 10),
                Text(
                  "${controller.subTotal}\$",
                  style: TextStyle(color: Colors.black, fontSize: 16),
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
              SizedBox(width: 10),
              Text("${controller.discount} %",
                  style: TextStyle(color: Colors.black, fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
