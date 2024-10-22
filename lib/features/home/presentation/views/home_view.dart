import 'package:coffe_shop/features/home/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:coffe_shop/features/home/presentation/cubits/navigation_cubit/navigation_cubit.dart';
import 'package:coffe_shop/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:coffe_shop/features/home/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/widgets/custom_bottom_navbar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<OffersCubit>(context)
            .getAllOffers(collectionName: kOffersCollection);
        BlocProvider.of<ProductCubit>(context)
            .getAllProducts(collectionName: kProductsCollection);
        BlocProvider.of<CategoryCubit>(context)
            .getAllCategories(collectionName: kCategoriesCollection);
      },
      child: BlocProvider(
        create: (_) => BottomNavCubit(),
        child: BlocBuilder<BottomNavCubit, int>(
          builder: (context, state) {
            return Scaffold(
              bottomNavigationBar: const CustomBottomNavigationBar(),
              backgroundColor: kBackgroundColor,
              resizeToAvoidBottomInset: false,
              body: context
                  .read<BottomNavCubit>()
                  .screens[state], // Change screen based on Cubit state
            );
          },
        ),
      ),
    );
  }
}
