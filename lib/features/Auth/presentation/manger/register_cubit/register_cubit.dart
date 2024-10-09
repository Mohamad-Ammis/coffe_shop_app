import 'package:bloc/bloc.dart';
import 'package:coffe_shop/core/utils/service_locator.dart';
import 'package:coffe_shop/core/utils/stripe_service.dart';
import 'package:coffe_shop/features/Auth/data/repo/auth_repo.dart';
import 'package:coffe_shop/features/checkout/data/models/customer_input_model.dart';
import 'package:coffe_shop/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;

  String password = "";
  String email = "";

  Future<void> register(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(RegisterLoading());

    var result =
        await authRepo.signupfirebase(email: email, password: password);
    result.fold((failure) {
      emit(RegisterFailure(errorMessage: failure.errorMessage));
    }, (success) {
      userInfo!.setBool("user", true);
      getIt
          .get<StripeService>()
          .createCustomer(customerModel: CustomerInputModel(email: email));
      emit(RegisterSuccess());
    });
  }

  void setregisteremail({required String n}) {
    email = n;
  }

  void setregisterpassword({required String p}) {
    password = p;
  }
}
