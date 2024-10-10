import 'package:coffe_shop/core/utils/assets.dart';
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
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Image.network(
        colorBlendMode: BlendMode.colorBurn,
        color: Colors.black12,
        product.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
