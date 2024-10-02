import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/core/utils/assets.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductRate extends StatelessWidget {
  const ProductRate({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(
          Assets.assetsImagesStar,
          width: 20,
          height: 20,
        ),
        4.horizontalSizedBox,
        Text(
          product.averageRate.toString(),
          style: Styles.style16SemiBold,
        ),
        Text(
          ' (${product.rateCounts})',
          style: Styles.style12Regular.copyWith(color: kLightSubTitleColor),
        )
      ],
    );
  }
}
