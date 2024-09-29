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
    return Container(
      height: 150,
      width: 350,
      child: Stack(
        children: [
          OffersPageView(
            indicatoController: indicatoController,
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.topCenter,
            child: OffersCardIndicator(
              indicatorController: indicatoController,
            ),
          ))
        ],
      ),
    );
  }
}
