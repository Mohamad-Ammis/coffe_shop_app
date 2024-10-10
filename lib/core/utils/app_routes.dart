import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/error_navigate_screen.dart';
import 'package:coffe_shop/core/utils/service_locator.dart';
import 'package:coffe_shop/features/Auth/data/repo/auth_repo_imp.dart';
import 'package:coffe_shop/features/Auth/presentation/manger/google_sign_in/google_sign_in_cubit.dart';
import 'package:coffe_shop/features/Auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:coffe_shop/features/Auth/presentation/manger/register_cubit/register_cubit.dart';
import 'package:coffe_shop/features/Auth/presentation/views/on_boarding_view.dart';
import 'package:coffe_shop/features/Auth/presentation/views/sign_in_view.dart';
import 'package:coffe_shop/features/Auth/presentation/views/sign_up_view.dart';
import 'package:coffe_shop/features/checkout/data/repo/checkout_repo_impl.dart';
import 'package:coffe_shop/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:coffe_shop/features/home/data/repos/home_repo_implementation.dart';
import 'package:coffe_shop/features/home/presentation/cubits/category_cubit/category_cubit.dart';
import 'package:coffe_shop/features/home/presentation/cubits/cubit/favorite_cubit.dart';
import 'package:coffe_shop/features/home/presentation/cubits/offers_cubit/offers_cubit.dart';
import 'package:coffe_shop/features/home/presentation/cubits/product_cubit/product_cubit.dart';
import 'package:coffe_shop/features/home/presentation/views/home_view.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/product_details_view.dart';
import 'package:coffe_shop/features/orders/data/repo/order_repo_implementation.dart';
import 'package:coffe_shop/features/orders/presentation/cubits/cubit/get_orders_cubit.dart';
import 'package:coffe_shop/features/orders/presentation/views/order_view.dart';
import 'package:coffe_shop/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
// GoRouter configuration
  static const String kHomeViewPath = '/homeView';
  static const String kProductDetialsViewPath = '/productDetails';
  static const String kOrdersViewPath = '/orderView';
  static const String kLoginView = "/LoginView";
  static const String ksignupView = "/SignupView";
  static const String konboarding = "/Onboarding";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
          path: konboarding,
          builder: (context, state) => const OnBoardingView()),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<LoginCubit>(
                create: (context) => LoginCubit(getIt.get<AuthRepoImp>())),
            BlocProvider<GoogleSignInCubit>(
                create: (context) =>
                    GoogleSignInCubit(getIt.get<AuthRepoImp>())),
          ],
          child: const SigninView(),
        ),
      ),
      GoRoute(
        path: ksignupView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<RegisterCubit>(
                create: (context) => RegisterCubit(getIt.get<AuthRepoImp>())),
            BlocProvider<GoogleSignInCubit>(
                create: (context) =>
                    GoogleSignInCubit(getIt.get<AuthRepoImp>())),
          ],
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: kHomeViewPath,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider<ProductCubit>(
              create: (context) =>
                  ProductCubit(homeRepo: getIt.get<HomeRepoImplementation>())
                    ..getAllProducts(collectionName: kProductsCollection),
            ),
            BlocProvider<CategoryCubit>(
              create: (context) =>
                  CategoryCubit(homeRepo: getIt.get<HomeRepoImplementation>())
                    ..getAllCategories(collectionName: kCategoriesCollection),
            ),
            BlocProvider<OffersCubit>(
              create: (context) =>
                  OffersCubit(homeRepo: getIt.get<HomeRepoImplementation>())
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
          return MultiBlocProvider(providers: [
            BlocProvider(
                create: (context) =>
                    CheckoutCubit(getIt.get<CheckoutRepoImpl>())),
            BlocProvider(create: (context) => FavoriteCubit()),
          ], child: ProductDetailsView(product: state.extra as ProductModel));
          // return BlocProvider(
          //   create: (context) => CheckoutCubit(getIt.get<CheckoutRepoImpl>()),
          //   child: ProductDetailsView(product: state.extra as ProductModel),
          // );
        },
      ),
      GoRoute(
        path: kOrdersViewPath,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              GetOrdersCubit(orderRepo: getIt.get<OrderRepoImplementation>())
                ..getAllOrders(),
          child: const OrderView(),
        ),
      )
    ],
  );
}
