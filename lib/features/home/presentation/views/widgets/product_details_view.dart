import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/assets.dart';
import 'package:coffe_shop/core/widgets/custom_appbar.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/product_details_widgets/buy_product_footer.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/product_details_widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BuyProductSection(
        product: product,
      ),
      backgroundColor: kBackgroundColor,
      appBar: const CustomAppbar(
        title: 'Details',
        svgActionIcon: Assets.assetsImagesHeart,
      ),
      body: ProductDetailsViewBody(product: product),
    );
  }
}
