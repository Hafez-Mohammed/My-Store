// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SocialSignButton extends StatelessWidget {
  final String text;
  final Color color;
  final IconData icon;
  final void Function()? onPressed;
  const SocialSignButton(
      {super.key,
      required this.text,
      required this.color,
      required this.icon,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: MaterialButton(
        onPressed: onPressed,
        color: color,
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(width: 5),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
