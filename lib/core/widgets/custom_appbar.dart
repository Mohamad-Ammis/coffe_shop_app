import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.svgActionIcon, this.hasBackIcon=false,
    this.style,
  });
  final String title;
  final String? svgActionIcon;
  final bool hasBackIcon;
  final TextStyle? style ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AppBar(
        backgroundColor: kBackgroundColor,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: hasBackIcon? IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)):null,
        title: Text(
          title,
          style:style?? Styles.style16SemiBold,
        ),
        actions: [if (svgActionIcon != null) SvgPicture.asset(svgActionIcon!)],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
