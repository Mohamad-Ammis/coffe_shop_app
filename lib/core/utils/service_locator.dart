import 'package:coffe_shop/core/utils/api_service.dart';
import 'package:coffe_shop/core/utils/firebase_service.dart';
import 'package:coffe_shop/core/utils/stripe_service.dart';
import 'package:coffe_shop/features/Auth/data/repo/auth_repo_imp.dart';
import 'package:coffe_shop/features/checkout/data/repo/checkout_repo_impl.dart';
import 'package:coffe_shop/features/home/data/repos/home_repo_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseService>(FirebaseService());
  getIt.registerSingleton<Dio>(Dio());

// Alternatively you could write it if you don't like global variables
  getIt.registerSingleton<ApiService>(ApiService(dio: getIt.get<Dio>()));
  getIt.registerSingleton<StripeService>(
      StripeService(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<HomeRepoImplementation>(
      HomeRepoImplementation(firebaseService: getIt.get<FirebaseService>()));
  getIt.registerSingleton<CheckoutRepoImpl>(CheckoutRepoImpl(stripeService: getIt.get<StripeService>()) );
  getIt.registerSingleton<AuthRepoImp>(AuthRepoImp(firebaseService: getIt.get<FirebaseService>()));
}
