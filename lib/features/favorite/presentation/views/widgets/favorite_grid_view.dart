import 'package:coffe_shop/features/favorite/presentation/views/widgets/favorite_card.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';

class FavoriteGridView extends StatelessWidget {
  const FavoriteGridView({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: FavoriteCard(product: products[index]),
        );
      },
    );
  }
}
