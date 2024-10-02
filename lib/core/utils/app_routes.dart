import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/error_navigate_screen.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:coffe_shop/features/home/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:coffe_shop/features/home/presentation/cubits/cubit/offers_cubit.dart';
import 'package:coffe_shop/features/home/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:coffe_shop/features/home/presentation/views/home_view.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/product_details_view.dart';
import 'package:coffe_shop/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
// GoRouter configuration
  static const String kHomeViewPath = '/homeView';
  static const String kProductDetialsViewPath = '/productDetails';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeViewPath,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<ProductCubit>(
              create: (context) => ProductCubit()
                ..getAllProducts(collectionName: kProductsCollection),
            ),
            BlocProvider<CategoryCubit>(
              create: (context) => CategoryCubit()
                ..getAllCategories(collectionName: kCategoriesCollection),
            ),
            BlocProvider<OffersCubit>(
              create: (context) => OffersCubit()
                ..getAllOffers(collectionName: kOffersCollection),
            ),
          ],
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: kProductDetialsViewPath,
        builder: (context, state) {
          if (state.extra == null) {
            return const NavigateErrorScreen();
          }
          return ProductDetailsView(product: state.extra as ProductModel);
        },
      ),
    ],
  );
}
