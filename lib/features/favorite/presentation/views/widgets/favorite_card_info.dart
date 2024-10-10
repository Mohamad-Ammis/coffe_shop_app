import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/core/utils/assets.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteCardInfo extends StatelessWidget {
  const FavoriteCardInfo({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * .35,
            child: Text(
              product.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Styles.style16SemiBold,
            ),
          ),
          8.verticalSizedBox,
          Row(
            children: [
              const Icon(Icons.tips_and_updates_rounded,
                  size: 16, color: Colors.black45),
              4.horizontalSizedBox,
              Text(
                product.category,
                style: Styles.style12Regular.copyWith(color: Colors.black45),
              ),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "(${product.rateCounts}) ${product.averageRate}",
                    style: Styles.style12Regular,
                  ),
                  4.horizontalSizedBox,
                  SvgPicture.asset(
                    Assets.assetsImagesStar,
                    height: 13,
                  )
                ],
              ),
            ],
          ),
          4.verticalSizedBox
        ],
      ),
    );
  }
}
