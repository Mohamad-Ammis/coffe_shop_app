import 'package:coffe_shop/features/favorite/presentation/views/widgets/favorite_card.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/home_widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FavoriteGridView extends StatelessWidget {
  const FavoriteGridView({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      gridDelegate: SliverWovenGridDelegate.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        pattern: [
          WovenGridTile(.8),
          WovenGridTile(
            4.7 / 7,
            crossAxisRatio: 1,
            alignment: AlignmentDirectional.centerEnd,
          ),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
        childCount: products.length,
        (context, index) => ProductCard(
          model: products[index],
        ),
      ),
    );
  }
}
