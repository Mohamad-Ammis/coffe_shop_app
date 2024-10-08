import 'package:coffe_shop/features/home/presentation/cubits/navigation_cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffe_shop/core/utils/assets.dart';
import 'package:coffe_shop/core/widgets/nav_bar_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      Assets.assetsImagesHome,
      Assets.assetsImagesHeart,
      Assets.assetsImagesBag,
      Assets.assetsImagesNotification,
    ];

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
                      final index = images.indexOf(e);
                      context.read<BottomNavCubit>().changeTab(index);
                    },
                    child: BlocBuilder<BottomNavCubit, int>(
                      builder: (context, state) {
                        return NavBarItem(
                          image: e,
                          isActive: state == images.indexOf(e),
                        );
                      },
                    ),
                  ))
              .toList()),
    );
  }
}
