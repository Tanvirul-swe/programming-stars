import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:programming_stars/src/config/dimention.dart';
import 'package:programming_stars/src/constant/style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonExist;
  final void Function()? onBackPressed;
  final bool showCart;
  const CustomAppBar(
      {super.key, required this.title,
      this.isBackButtonExist = true,
      this.onBackPressed,
      this.showCart = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: robotoRegular.copyWith(
            fontSize: Dimensions.fontSizeLarge,
            // color: Theme.of(context).textTheme.bodyLarge?.color,
          )),
      centerTitle: true,
      leading: isBackButtonExist
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              // color: Theme.of(context).textTheme.bodyLarge?.color,
              onPressed: () => onBackPressed ?? Navigator.pop(context),
            )
          : const SizedBox(),
      backgroundColor: Theme.of(context).cardColor,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize =>
      Size(Dimensions.WEB_MAX_WIDTH, GetPlatform.isDesktop ? 70 : 50);
}
