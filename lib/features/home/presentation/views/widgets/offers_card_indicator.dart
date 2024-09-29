import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OffersCardIndicator extends StatelessWidget {
  OffersCardIndicator({
    super.key,
    required this.indicatorController,
  });
// /  final dynamic adsList;
  final PageController indicatorController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width - 24,
      height: 10,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.only(top: 8),
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(),
      // margin: EdgeInsets.symmetric(horizontal: 12),
      child: SmoothPageIndicator(
        controller: indicatorController,
        count: 4,
        effect: CustomizableEffect(
          spacing: 8,
          dotDecoration: DotDecoration(
              width: (MediaQuery.sizeOf(context).width / (4 + 1)) - 8,
              height: 5,
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8)),
          activeDotDecoration: DotDecoration(
              width: (MediaQuery.sizeOf(context).width / (4 + 1)) - 8,
              height: 5,
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
