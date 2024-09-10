import 'package:flutter/material.dart';

class OrderCellText extends StatelessWidget {
  final String text;
  const OrderCellText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontWeight: FontWeight.normal),
    );
  }
}
