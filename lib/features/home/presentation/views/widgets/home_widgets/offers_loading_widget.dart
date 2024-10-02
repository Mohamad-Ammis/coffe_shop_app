
import 'package:coffe_shop/core/utils/shimmer_custom_container.dart';
import 'package:flutter/material.dart';

class OffersLoadingWidget extends StatelessWidget {
  const OffersLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShimmerContainer(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      height: MediaQuery.sizeOf(context).height / 6,
      width: MediaQuery.sizeOf(context).width,
      circularRadius: 15,
    );
  }
}
