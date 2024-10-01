import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/widgets/custom_error_widget.dart';
import 'package:coffe_shop/features/home/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:coffe_shop/features/home/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/category_item.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/category_loading_shimmer_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategorySuccess) {
          return Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: state.showCategory ? 35 : 0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        var cubit = BlocProvider.of<ProductCubit>(context);
                        currentIndex = index;
                        setState(() {});
                        cubit.getProductsByCategory(
                          collectionName: kProductsCollection,
                          category: state.categories[index].name,
                        );
                        cubit.selectedCategory = state.categories[index].name;
                      },
                      child: CategoryItem(
                        title: state.categories[index].name,
                        isActive: currentIndex == index,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is CategoryFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CategoryLoadingShimmerListView();
        }
      },
    );
  }
}
