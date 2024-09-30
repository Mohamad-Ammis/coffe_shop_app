import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/features/home/presentation/cubits/cubit/product_cubit.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  int currentIndex = 0;
  final List<String> categories = const [
    "All Coffee",
    'Machiato',
    'Latte',
    'Americano'
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  currentIndex = index;
                  setState(() {});
                  BlocProvider.of<ProductCubit>(context).getProductsByCategory(
                      collectionName: kProductsCollection,
                      category: categories[index]);
                },
                child: CategoryItem(
                    title: categories[index],
                    isActive: currentIndex == index ? true : false));
          }),
    );
  }
}
