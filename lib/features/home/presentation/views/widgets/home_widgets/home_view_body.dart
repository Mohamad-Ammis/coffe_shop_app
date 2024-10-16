import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_routes.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/home_widgets/offers_section.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/home_widgets/products_section.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/home_widgets/search_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
                    child: const OffersSection()),
              Positioned(
                  right: kMainPagePadding,
                  top: kMainPagePadding + 20,
                  child: InkWell(
                    onTap: () => GoRouter.of(context).push(AppRouter.kCartPage),
                    child: const SizedBox(
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ))
            ],
          ),
        )
      ],
    );
  }
}
