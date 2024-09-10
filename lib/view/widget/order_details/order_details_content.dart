import 'package:flutter/material.dart';

class OrderDetailsContent extends StatelessWidget {
  final String text;
  const OrderDetailsContent({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.red),
    );
  }
}
