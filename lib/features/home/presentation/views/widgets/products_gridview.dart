import 'package:coffe_shop/features/home/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: 20,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // childAspectRatio: 0.65,
            mainAxisExtent: 240,
            mainAxisSpacing: 8,
            crossAxisSpacing: 16),
        itemBuilder: (context, index) {
          return const ProductCard();
        });
  }
}
