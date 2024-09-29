import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: slidingAnimation,
            child: const Text(
              'Welcome in coffee world',
              style: Styles.style18SemiBold,
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
