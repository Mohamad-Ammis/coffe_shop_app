import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_routes.dart';
import 'package:coffe_shop/core/utils/custom_snackpar.dart';
import 'package:coffe_shop/features/Auth/presentation/manger/google_sign_in/google_sign_in_cubit.dart';
import 'package:coffe_shop/features/Auth/presentation/views/widget/image_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthWithGoogle extends StatelessWidget {
  const AuthWithGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GoogleSignInCubit, GoogleSignInState>(
      listener: (context, state) {
        if (state is GoogleSignInFailure) {
          log(state.errorMessage);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(CustomSnackBar().customSnackBar(
                'Oops', state.errorMessage, ContentType.failure));
        }
        if (state is GoogleSignInSuccess) {
          GoRouter.of(context).push(AppRouter.kHomeViewPath);
        }
      },
      child: ImageButton(
        image: "assets/images/google.png",
        child: BlocBuilder<GoogleSignInCubit, GoogleSignInState>(
          builder: (context, state) {
            if (state is GoogleSignInLoading) {
              return const CircularProgressIndicator(
                color: Colors.black,
              );
            } else {
              return Text(
                "Google",
                style: TextStyle(
                  fontFamily: kFontFamily,
                  fontSize: MediaQuery.of(context).size.height * 0.018,
                  color: Colors.black,
                ),
              );
            }
          },
        ),
        onTap: () async {
          BlocProvider.of<GoogleSignInCubit>(context).signingoogle();
        },
      ),
    );
  }
}
