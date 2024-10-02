
import 'package:coffe_shop/features/home/presentation/views/widgets/home_widgets/product_loading_shimmer_card.dart';
import 'package:flutter/material.dart';

class ProductLoadingShimmerGridView extends StatelessWidget {
  const ProductLoadingShimmerGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        cacheExtent: 10,
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // childAspectRatio: 0.65,
            mainAxisExtent: 240,
            mainAxisSpacing: 8,
            crossAxisSpacing: 16),
        itemBuilder: (context, index) {
          // ignore: prefer_const_constructors
          return ProductLoadingShimmerCard();
        });
  }
}
