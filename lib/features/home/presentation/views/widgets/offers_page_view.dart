import 'package:flutter/material.dart';

class OffersPageView extends StatelessWidget {
  const OffersPageView({super.key, required this.indicatoController});
  final PageController indicatoController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 6,
      width: MediaQuery.sizeOf(context).width,
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
