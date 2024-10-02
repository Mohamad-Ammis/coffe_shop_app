import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: Styles.style20SemiBold,
        ),
        product.description.isNotEmpty
            ? Container(
                constraints: const BoxConstraints(minHeight: 0, maxHeight: 60),
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Text(
                      product.description,
                      // maxLines: 3,
                      overflow: TextOverflow.visible,
                      style: Styles.style14Regular
                          .copyWith(color: kLightSubTitleColor),
                    ),
                  ),
                ),
              )
            : Text(
                "There is No Description added by product owner",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style:
                    Styles.style14Regular.copyWith(color: kLightSubTitleColor),
              ),
      ],
    );
  }
}
