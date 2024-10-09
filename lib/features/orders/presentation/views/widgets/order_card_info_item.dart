
import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:flutter/material.dart';

class OrderCardInfoItem extends StatelessWidget {
  const OrderCardInfoItem({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Styles.style14Regular,
        ),
        6.verticalSizedBox,
        Text(
          subTitle,
          style: Styles.style12Regular.copyWith(color: kLightSubTitleColor),
        ),
      ],
    );
  }
}
