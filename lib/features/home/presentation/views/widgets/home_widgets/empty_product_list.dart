
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyProductsList extends StatelessWidget {
  const EmptyProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Lottie.asset(Assets.assetsLottieEmptyList,
              fit: BoxFit.contain),
          const Text(
            "Sorry There is No Products here",
            style: Styles.style14Regular,
          )
        ],
      );
  }
}
