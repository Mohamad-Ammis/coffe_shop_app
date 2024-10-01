import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/core/utils/assets.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/core/widgets/custom_icon_button.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.model,
  });
  final ProductModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                CachedNetworkImage(
                  imageUrl: model.image,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Positioned.fill(
                    child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        color: const Color(0xff313131).withOpacity(.3),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          topRight: Radius.circular(10),
                        )),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.assetsImagesStar,
                          width: 15,
                          height: 15,
                        ),
                        4.horizontalSizedBox,
                        Text(
                          model.averageRate.toString(),
                          style: Styles.style12Regular.copyWith(
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ))
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  model.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.style16SemiBold,
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  model.category,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        r'$' '${model.price}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.style18SemiBold,
                      ),
                    ),
                    const CustomIconButton()
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
