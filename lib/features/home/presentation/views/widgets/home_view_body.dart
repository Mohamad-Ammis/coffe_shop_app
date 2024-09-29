import 'package:coffe_shop/features/home/presentation/views/widgets/offers_section.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/products_section.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/search_section.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            children: [
              const Column(
                children: [
                  SearchSection(),
                  ProductsSection(),
                ],
              ),
              if (MediaQuery.sizeOf(context).width > 360)
                Positioned(
                    left: 0,
                    right: 0,
                    top: MediaQuery.sizeOf(context).height / 6 * 2 -
                        (MediaQuery.sizeOf(context).height / 6) / 2,
                    child: const OffersSection())
            ],
          ),
        )
      ],
    );
  }
}
