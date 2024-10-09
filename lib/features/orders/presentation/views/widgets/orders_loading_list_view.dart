
import 'package:coffe_shop/core/utils/shimmer_custom_container.dart';
import 'package:flutter/material.dart';

class OrdersLoadingListView extends StatelessWidget {
  const OrdersLoadingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return const ShimmerContainer(
          width: double.infinity,
          height: 130,
          circularRadius: 10,
          margin: EdgeInsets.symmetric(vertical: 8),
        );
      },
    );
  }
}
