import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersTitle extends StatelessWidget {
  const OrdersTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Orders",
      textAlign: TextAlign.center,
      style:
          Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 22.sp),
    );
  }
}
