
import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:coffe_shop/features/favorite/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/product_details_widgets/buy_product_footer.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/product_details_widgets/product_details_appbar.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/product_details_widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit()..getFavorites(),
      child: Scaffold(
        bottomNavigationBar: BuyProductSection(
          product: product,
        ),
        backgroundColor: kBackgroundColor,
        appBar: ProductDetailsAppbar(product: product),
        body: ProductDetailsViewBody(product: product),
      ),
    );
  }
}
