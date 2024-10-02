
import 'package:coffe_shop/core/utils/shimmer_custom_container.dart';
import 'package:flutter/material.dart';

class CategoryLoadingShimmerListView extends StatelessWidget {
  const CategoryLoadingShimmerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: ShimmerContainer(
                  width: 100, height: 35, circularRadius: 10),
            );
          }),
    );
  }
}
