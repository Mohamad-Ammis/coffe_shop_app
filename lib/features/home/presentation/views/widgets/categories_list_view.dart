
import 'package:coffe_shop/features/home/presentation/views/widgets/category_item.dart';
import 'package:flutter/material.dart';

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
                },
                child: CategoryItem(
                    title: categories[index],
                    isActive: currentIndex == index ? true : false));
          }),
    );
  }
}
