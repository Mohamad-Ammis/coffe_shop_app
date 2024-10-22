import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/widgets/custom_empty_widget.dart';
import 'package:coffe_shop/core/widgets/custom_error_widget.dart';
import 'package:coffe_shop/features/favorite/presentation/cubits/favorite_cubit/favorite_cubit.dart';
import 'package:coffe_shop/features/favorite/presentation/views/widgets/favorite_grid_view.dart';
import 'package:coffe_shop/features/favorite/presentation/views/widgets/favorite_loading_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteSuccess) {
            return state.favorites.isNotEmpty
                ? FavoriteGridView(
                    products: state.favorites,
                  )
                : const Padding(
                    padding: EdgeInsets.all(kMainPagePadding),
                    child: CustomEmptyWidget(
                      title: 'You dont have any favorite product',
                    ),
                  );
          } else if (state is FavoriteFailure) {
            return CustomErrorWidget(errMessage: state.error);
          } else {
            return const FavoriteLoadingListView();
          }
        },
      ),
    );
  }
}
