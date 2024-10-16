
import 'package:coffe_shop/core/utils/shimmer_custom_container.dart';
import 'package:flutter/material.dart';

class FavoriteLoadingListView extends StatelessWidget {
  const FavoriteLoadingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 8,
      itemBuilder: (context, index) {
        return const ShimmerContainer(
          width: double.infinity,
          height: 100,
          circularRadius: 16,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
        );
      },
    );
  }
}
