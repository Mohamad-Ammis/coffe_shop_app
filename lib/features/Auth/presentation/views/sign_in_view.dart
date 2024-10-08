import 'package:coffe_shop/features/Auth/presentation/views/widget/Background_view.dart';
import 'package:coffe_shop/features/Auth/presentation/views/widget/sign_in_body.dart';
import 'package:flutter/material.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BackgroundView(
      goback: false,
        screen: SignInBody());
  }
}
