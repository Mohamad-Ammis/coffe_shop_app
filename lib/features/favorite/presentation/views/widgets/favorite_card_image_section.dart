
import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class FavoriteCardImageSection extends StatelessWidget {
  const FavoriteCardImageSection({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {

    return CachedNetworkImage(
      height: 100,
      width: 120,
      fit: BoxFit.cover,
      imageUrl: product.image,
      imageBuilder: (context, imageProvider) => Container(
        clipBehavior: Clip.hardEdge,
        height: 100,
        width: 120,
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
    );
  }
}
