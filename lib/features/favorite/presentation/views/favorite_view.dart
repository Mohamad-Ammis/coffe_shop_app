import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/widgets/custom_appbar.dart';
import 'package:coffe_shop/features/favorite/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:coffe_shop/features/favorite/presentation/views/widgets/favorite_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: CustomAppbar(
          title: 'My Favorites',
          hasBackIcon: false,
          svgActionIcon: null,
        ),
        body: BlocProvider(
          create: (context) => FavoriteCubit()..getFavorites(),
          child: FavoriteViewBody(),
        ));
  }
}
