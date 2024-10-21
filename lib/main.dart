import 'dart:developer';

import 'package:coffe_shop/core/utils/api_keys.dart';
import 'package:coffe_shop/core/utils/app_routes.dart';
import 'package:coffe_shop/core/utils/service_locator.dart';
import 'package:coffe_shop/features/cart/data/model/item_cart_model.dart';
import 'package:coffe_shop/features/cart/data/repo/cart_repo_imp.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/paid_cart_cubit/paid_cart_cubit.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/stripe_cart/stripe_cart_cubit.dart';
import 'package:coffe_shop/features/checkout/data/repo/checkout_repo_impl.dart';
import 'package:coffe_shop/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? userInfo;
List<CartModel> cartitem = [];

//flutterfire configure --project=coffe-shop-f3918
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = ApiKeys.publishableKey;
  await Stripe.instance.applySettings();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  userInfo = await SharedPreferences.getInstance();
  setup();
  runApp(const MyApp());
  log(userInfo!.getString('payment_token').toString());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(
            create: (context) => PaidCartCubit(cartRepo: CartRepoImp())),
        BlocProvider(
            create: (context) =>
                StripeCartCubit(checkoutRepo: getIt.get<CheckoutRepoImpl>()))
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
