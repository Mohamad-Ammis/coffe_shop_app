import 'package:coffe_shop/features/home/presentation/views/widgets/offers_card_indicator.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/offers_page_view.dart';
import 'package:flutter/material.dart';

class OffersSection extends StatefulWidget {
  const OffersSection({super.key});

  @override
  State<OffersSection> createState() => _OffersSectionState();
}

class _OffersSectionState extends State<OffersSection> {
  final PageController indicatoController = PageController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 6,
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          OffersPageView(
            indicatoController: indicatoController,
          ),
          Positioned.fill(
              top: -120,
              child: Align(
                child: OffersCardIndicator(
                  indicatorController: indicatoController,
                ),
              ))
        ],
      ),
    );
  }
}
