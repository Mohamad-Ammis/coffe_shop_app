import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coffe_shop/core/utils/service_locator.dart';
import 'package:coffe_shop/core/utils/stripe_service.dart';
import 'package:coffe_shop/features/Auth/data/repo/auth_repo.dart';
import 'package:coffe_shop/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo;

  String password = "";
  String email = "";

  Future<void> login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      emit(LoginLoading());

      var result =
          await authRepo.signinfirebase(email: email, password: password);
      result.fold((failure) {
        emit(LoginFailure(errorMessage: failure.errorMessage));
      }, (success) {
        userInfo!.setBool("user", true);
        getIt.get<StripeService>().getCustomer(email: email);
        emit(LoginSuccess());
      });
    } on Exception catch (e) {
      log('e: $e');
    }
  }

  void setloginemail({required String n}) {
    email = n;
  }

  void setloginpassword({required String p}) {
    password = p;
  }
}
