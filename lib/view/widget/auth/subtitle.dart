import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthSubtitle extends StatelessWidget {
  final String text;
  const AuthSubtitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontSize: 14.sp, fontWeight: FontWeight.normal),
    );
  }
}
