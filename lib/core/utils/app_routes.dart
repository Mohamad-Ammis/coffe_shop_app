import 'package:coffe_shop/features/home/presentation/cubits/cubit/product_cubit.dart';
import 'package:coffe_shop/features/home/presentation/views/home_view.dart';
import 'package:coffe_shop/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
class AppRouter {
// GoRouter configuration
  static const String kHomeViewPath = '/homeView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeViewPath,
        builder: (context, state) => BlocProvider(
          create: (context) => ProductCubit()..getAllProducts(),
          child: const HomeView(),
        ),
      ),
    ],
  );
}
