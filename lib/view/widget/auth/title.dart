import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  final String text;
  const AuthTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}
