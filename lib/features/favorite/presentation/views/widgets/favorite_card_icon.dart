import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/features/favorite/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteCardIcon extends StatelessWidget {
  const FavoriteCardIcon({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        return Positioned.fill(
            child: Align(
          alignment: Alignment.topRight,
          child: Container(
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16))),
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: state is FavoriteSuccess
                ? GestureDetector(
                    onTap: () {
                      BlocProvider.of<FavoriteCubit>(context)
                          .removeFromFavorites(product);
                    },
                    child: const Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  )
                : state is FavoriteFailure
                    ? const Icon(Icons.error)
                    : const CircularProgressIndicator(),
          ),
        ));
      },
    );
  }
}
