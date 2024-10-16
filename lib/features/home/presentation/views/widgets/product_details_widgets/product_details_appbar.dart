import 'dart:developer';

import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/core/widgets/custom_loading_widget.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:coffe_shop/features/favorite/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const ProductDetailsAppbar({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        title: const Text(
          'Details',
          style: Styles.style16SemiBold,
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<FavoriteCubit, FavoriteState>(
            builder: (context, state) {
              final cubit = context.read<FavoriteCubit>();
              if (state is FavoriteLoading) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: CustomLoadingWidget(),
                );
              }
              if (state is FavoriteSuccess) {
                final isFavorite = state.favorites.any((favProduct) {
                  log(favProduct.id.toString());
                  return favProduct.id == product.id;
                });
                return IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.black,
                  ),
                  onPressed: () {
                    if (isFavorite) {
                      cubit.removeFromFavorites(product);
                    } else {
                      cubit.addToFavorites(product);
                    }
                  },
                );
              }
              return const Icon(
                Icons.favorite_border_outlined,
                color: Colors.black,
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 56);
}
