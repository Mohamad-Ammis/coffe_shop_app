import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/product_details_widgets/product_rate.dart';
import 'package:flutter/material.dart';

class ProductBasicInfo extends StatelessWidget {
  const ProductBasicInfo({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name,
          style: Styles.style20SemiBold,
        ),
        4.verticalSizedBox,
        Text(
          product.category,
          style: Styles.style12Regular.copyWith(color: kLightSubTitleColor),
        ),
        16.verticalSizedBox,
        ProductRate(product: product),
      ],
    );
  }
}
