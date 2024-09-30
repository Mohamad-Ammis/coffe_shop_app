import 'package:coffe_shop/core/widgets/custom_error_widget.dart';
import 'package:coffe_shop/core/widgets/custom_loading_widget.dart';
import 'package:coffe_shop/features/home/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return GridView.builder(
              cacheExtent: 10,
              itemCount: state.products.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  // childAspectRatio: 0.65,
                  mainAxisExtent: 240,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 16),
              itemBuilder: (context, index) {
                return ProductCard(
                  model: state.products[index],
                );
              });
        } else if (state is ProductFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return CustomLoadingWidget();
        }
      },
    );
  }
}
