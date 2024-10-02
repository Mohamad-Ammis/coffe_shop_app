
import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
    required this.isActive,
  });
  final String title;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
          color: isActive ? kPrimaryColor : kLightGreyColor,
          borderRadius: BorderRadius.circular(8)),
      duration: const Duration(milliseconds: 500),
      child: Text(
        title,
        style: isActive
            ? Styles.style14SemiBold.copyWith(color: Colors.white)
            : Styles.style14Regular.copyWith(
                color: isActive ? Colors.white : Colors.black,
              ),
      ),
    );
  }
}
// MediaQuery.sizeOf(context).height / 6 * 2 to be in end of search section
//- (150 / 2) which is half of its height to be in middle
