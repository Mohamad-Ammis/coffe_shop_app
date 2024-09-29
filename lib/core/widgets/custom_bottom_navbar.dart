
import 'package:coffe_shop/core/utils/assets.dart';
import 'package:coffe_shop/core/widgets/nav_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int currentIndex = 0;
  final List<String> images = [
    Assets.assetsImagesHome,
    Assets.assetsImagesHeart,
    Assets.assetsImagesBag,
    Assets.assetsImagesNotification,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32), topRight: Radius.circular(32))),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: images
              .map((e) => GestureDetector(
                    onTap: () {
                      currentIndex = images.indexOf(e);
                      setState(() {});
                    },
                    child: NavBarItem(
                      image: e,
                      isActive:
                          currentIndex == images.indexOf(e) ? true : false,
                    ),
                  ))
              .toList()),
    );
  }
}
