import 'package:coffe_shop/core/utils/app_routes.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/core/utils/assets.dart';
import 'package:coffe_shop/core/utils/service_locator.dart';
import 'package:coffe_shop/core/utils/stripe_service.dart';
import 'package:coffe_shop/core/widgets/custom_error_widget.dart';
import 'package:coffe_shop/features/home/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/home_widgets/product_card.dart';
// ignore: unused_import
import 'package:coffe_shop/features/home/presentation/views/widgets/home_widgets/product_loading_shimmer_card.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/home_widgets/product_loading_shimmer_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return state.products.isEmpty
              ? const EmptyProductsList()
              : GridView.builder(
                  cacheExtent: 10,
                  itemCount: state.products.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 240,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 16),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        await getIt
                            .get<StripeService>()
                            .getCustomer(email: 'esd67618@gmail.com');
                      },
                      child: ProductCard(
                        model: state.products[index],
                      ),
                    );
                  });
        } else if (state is ProductFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const ProductLoadingShimmerGridView();
        }
      },
    );
  }
}

class EmptyProductsList extends StatelessWidget {
  const EmptyProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Lottie.asset(Assets.assetsLottieEmptyList, fit: BoxFit.contain),
        const Text(
          "Sorry There is No Products here",
          style: Styles.style14Regular,
        )
      ],
    );
  }
}
