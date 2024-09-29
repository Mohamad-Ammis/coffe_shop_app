import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/core/utils/assets.dart';
import 'package:coffe_shop/core/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              Assets.assetsImagesTestProduct,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Caffe Mocha',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.style16SemiBold,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Deep Foam',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.style12Regular
                      .copyWith(color: kLightSubTitleColor),
                ),
                const Expanded(
                  child: SizedBox(
                    height: 10,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        r'$50.12',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.style18SemiBold,
                      ),
                    ),
                    CustomIconButton()
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
