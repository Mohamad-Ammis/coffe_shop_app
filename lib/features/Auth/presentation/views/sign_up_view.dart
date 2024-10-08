import 'package:coffe_shop/features/Auth/presentation/views/widget/Background_view.dart';
import 'package:coffe_shop/features/Auth/presentation/views/widget/sign_up_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundView(
      goback: true,
      screen: SignUpBody());
  }
}