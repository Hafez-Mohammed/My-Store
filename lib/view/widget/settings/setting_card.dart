import 'package:flutter/material.dart';

class SettingCard extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;
  const SettingCard(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(text),
        onTap: onTap,
        leading: Icon(
          icon,
          size: 25,
          color: Colors.orange[300],
        ),
      ),
    );
  }
}
