import 'package:coffe_shop/features/Auth/presentation/views/widget/auth_with_facebook.dart';
import 'package:coffe_shop/features/Auth/presentation/views/widget/auth_with_google.dart';
import 'package:flutter/material.dart';

class AuthWithSocial extends StatelessWidget {
  const AuthWithSocial({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AuthWithGoogle(),
        SizedBox(
          width: 30,
        ),
        AuthWithFacebook()
      ],
    );
  }
}
