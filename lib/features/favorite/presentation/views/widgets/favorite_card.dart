
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/features/favorite/presentation/views/widgets/favorite_card_icon.dart';
import 'package:coffe_shop/features/favorite/presentation/views/widgets/favorite_card_image_section.dart';
import 'package:coffe_shop/features/favorite/presentation/views/widgets/favorite_card_info.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow:const [BoxShadow(blurRadius: 10, color: Colors.black12)]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //image
              Expanded(
                  flex: 2, child: FavoriteCardImageSection(product: product)),
              8.horizontalSizedBox,
              Expanded(flex: 3, child: FavoriteCardInfo(product: product)),
            ],
          ),
        ),
        FavoriteCardIcon(product: product,)
      ],
    );
  }
}
