import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_store/core/constants/app_image_assets.dart';
import 'package:my_store/core/constants/app_theme.dart';

class CustomAppBar extends  StatelessWidget implements PreferredSizeWidget{
  final void Function() onPressedOrderIcon;
  final void Function() onPressedFavoriteIcon;
  const CustomAppBar(
      {super.key,
      required this.onPressedOrderIcon,
      required this.onPressedFavoriteIcon});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white10,
      surfaceTintColor: Colors.white10,
      toolbarHeight: 70,
      titleSpacing: 0,
      title: ListTile(
        title: Text(
          "My Store",
          style: AppTheme.englishLightTheme.textTheme.displayLarge!
              .copyWith(fontSize: 22),
        ),
        subtitle:  Text(
          "64".tr,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),
      ),
      actions: [
        IconButton(
            onPressed: onPressedOrderIcon,
            icon: SvgPicture.asset(AppImageAssets.orders)),
        IconButton(
            onPressed: onPressedFavoriteIcon,
            icon: SvgPicture.asset(AppImageAssets.favorites)),
      ],
    );
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
