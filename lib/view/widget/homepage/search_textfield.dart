import 'package:flutter/material.dart';
import 'package:my_store/core/constants/app_colors.dart';

class SearchTextfield extends StatelessWidget {
  final String hint;
  final void Function() onIconPressed;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  const SearchTextfield(
      {super.key, required this.hint, required this.onIconPressed,required this.onChanged,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.homeBackgroundColor,
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 14),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: IconButton(
              onPressed: onIconPressed,
              iconSize: 30,
              icon: const Icon(Icons.search_outlined)),
        ),
        border: OutlineInputBorder(
            borderSide: const BorderSide(style: BorderStyle.none, width: 0),
            borderRadius: BorderRadius.circular(10)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(style: BorderStyle.none, width: 0),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(style: BorderStyle.none, width: 0),
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
