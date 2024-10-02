
import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class ProductDetailsSizeItem extends StatelessWidget {
  const ProductDetailsSizeItem({
    super.key,
    required this.size,
    required this.isActive,
  });
  final String size;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: 96,
      decoration: BoxDecoration(
          border: Border.all(
              color: isActive ? kPrimaryColor : kBorderColor, width: .3),
          color: isActive ? kPrimaryLightColor : Colors.white,
          borderRadius: BorderRadius.circular(16)),
      duration: const Duration(milliseconds: 300),
      child: Center(
        child: Text(
          size,
          style: Styles.style14Regular,
        ),
      ),
    );
  }
}
