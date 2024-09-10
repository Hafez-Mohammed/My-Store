import 'package:flutter/material.dart';

class OrderDetailsTitle extends StatelessWidget {
  final String text;
  const OrderDetailsTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }
}
