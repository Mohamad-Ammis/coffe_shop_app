import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/core/utils/shimmer_custom_container.dart';
import 'package:flutter/material.dart';

class ProductLoadingShimmerCard extends StatelessWidget {
  const ProductLoadingShimmerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[330],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ShimmerContainer(
              width: MediaQuery.sizeOf(context).width,
              height: 10,
              circularRadius: 15,
              margin: const EdgeInsets.all(8),
            ),
          ),
          10.verticalSizedBox,
          const ShimmerContainer(
            width: double.infinity,
            height: 20,
            circularRadius: 10,
            margin: EdgeInsets.only(left: 8, right: 20),
          ),
          8.verticalSizedBox,
          const ShimmerContainer(
            width: 80,
            height: 20,
            circularRadius: 10,
            margin: EdgeInsets.only(left: 8, right: 20),
          ),
          8.verticalSizedBox,
          const ShimmerContainer(
            width: double.infinity,
            height: 20,
            circularRadius: 10,
            margin: EdgeInsets.only(left: 8, right: 20),
          ),
          10.verticalSizedBox
        ],
      ),
    );
  }
}
