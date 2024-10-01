import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/features/home/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/categories_list_view.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/products_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMainPagePadding),
      child: Column(
        children: [
          if (MediaQuery.sizeOf(context).width > 360)
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 6 / 2,
            ),
            const CategoriesListView(),
              
          const ProductsGridView()
        ],
      ),
    );
  }
}
