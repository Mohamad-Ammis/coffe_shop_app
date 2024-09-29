import 'package:coffe_shop/features/home/presentation/views/widgets/offers_section.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/search_section.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const Expanded(flex: 2, child: SearchSection()),
            Expanded(flex: 4, child: Container()),
          ],
        ),
        Positioned(
            left: 0,
            right: 0,
            // MediaQuery.sizeOf(context).height / 6 * 2 to be in end of search section
            //- (150 / 2) which is half of its height to be in middle
            top: MediaQuery.sizeOf(context).height / 6 * 2 - (150 / 2),
            child: OffersSection())
      ],
    );
  }
}
