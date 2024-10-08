import 'package:coffe_shop/core/utils/api_keys.dart';
import 'package:coffe_shop/core/utils/app_routes.dart';
import 'package:coffe_shop/core/utils/service_locator.dart';
import 'package:coffe_shop/firebase_options.dart';
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
  runApp(
    const MyApp(), // Wrap your app
  );
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
