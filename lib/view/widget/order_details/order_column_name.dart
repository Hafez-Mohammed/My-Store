import 'package:flutter/material.dart';

class OrderColumnName extends StatelessWidget {
  final String text;
  const OrderColumnName({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.bold, color: Colors.green[300], fontSize: 18),
    );
  }
}
