import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/product_details_widgets/product_details_image_section.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/product_details_widgets/product_details_info.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: 24.verticalSizedBox,
          ),
          SliverToBoxAdapter(
            child: ProductDetailsImageSection(
              image: product.image,
            ),
          ),
          SliverToBoxAdapter(
            child: 12.verticalSizedBox,
          ),
          SliverToBoxAdapter(
            child: ProductDetailsInfo(
              product: product,
            ),
          )
        ],
      ),
    );
  }
}
