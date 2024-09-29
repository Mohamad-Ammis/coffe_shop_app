import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OffersCardIndicator extends StatelessWidget {
  const OffersCardIndicator({
    super.key,
    required this.indicatorController,
  });
// /  final dynamic adsList;
  final PageController indicatorController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 10,
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.only(top: 0),
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(),
      // margin: EdgeInsets.symmetric(horizontal: 12),
      child: SmoothPageIndicator(
        controller: indicatorController,
        count: 4,
        effect: CustomizableEffect(
          spacing: 4,
          dotDecoration: DotDecoration(
              width: 30,
              height: 5,
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8)),
          activeDotDecoration: DotDecoration(
              width: 50,
              height: 5,
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
