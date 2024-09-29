import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OffersPageView extends StatelessWidget {
  const OffersPageView({super.key, required this.indicatoController});
  final PageController indicatoController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(0)),
      child: PageView.builder(
          controller: indicatoController,
          itemCount: 4,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/offers.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          }),
    );
  }
}
