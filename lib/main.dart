import 'dart:developer';

import 'package:coffe_shop/core/utils/api_keys.dart';
import 'package:coffe_shop/core/utils/app_routes.dart';
import 'package:coffe_shop/core/utils/service_locator.dart';
import 'package:coffe_shop/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? userInfo;

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
  runApp(DevicePreview(
    builder: (context) {
      return const MyApp(); // Wrap your app
    },
  ));
  log(userInfo!.getString('payment_token').toString());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
