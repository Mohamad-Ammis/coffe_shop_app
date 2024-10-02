import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/product_details_widgets/product_details_sizes_item.dart';
import 'package:flutter/material.dart';

class SizesListView extends StatefulWidget {
  const SizesListView({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  State<SizesListView> createState() => _SizesListViewState();
}

class _SizesListViewState extends State<SizesListView> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.product.sizes.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                currentIndex = index;
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: ProductDetailsSizeItem(
                  size: widget.product.sizes[index],
                  isActive: currentIndex == index ? true : false,
                ),
              ),
            );
          }),
    );
  }
}
