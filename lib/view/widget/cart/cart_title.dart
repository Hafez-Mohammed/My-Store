import 'package:flutter/material.dart';

class CartTitle extends StatelessWidget {
  const CartTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "My Cart",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 22),
    );
  }
}
