// ignore_for_file: use_build_context_synchronously

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_routes.dart';
import 'package:coffe_shop/core/utils/custom_snackpar.dart';
import 'package:coffe_shop/core/utils/service_locator.dart';
import 'package:coffe_shop/core/utils/stripe_service.dart';
import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/features/Auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:coffe_shop/features/Auth/presentation/views/widget/custom_auth_with_social.dart';
import 'package:coffe_shop/features/Auth/presentation/views/widget/custom_login_fields.dart';
import 'package:coffe_shop/features/Auth/presentation/views/widget/custom_text.dart';
import 'package:coffe_shop/features/Auth/presentation/views/widget/register_in_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(CustomSnackBar().customSnackBar(
                  'Oops', state.errorMessage, ContentType.failure));
          } else if (state is LoginSuccess) {
            GoRouter.of(context).pushReplacement(AppRouter.kHomeViewPath);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CustomText(
                title: "Welcome Back !",
                size: 28,
                alignment: Alignment.center,
                top: 10,
              ),
              const RegisterInLogin(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Form(key: formkey, child: const CustomLoginFields()),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              CustomButton(
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    try {
                      formkey.currentState!.save();
                      await BlocProvider.of<LoginCubit>(context).login(
                          context: context,
                          email: BlocProvider.of<LoginCubit>(context).email,
                          password:
                              BlocProvider.of<LoginCubit>(context).password);

                      getIt.get<StripeService>().getCustomer(
                          email: BlocProvider.of<LoginCubit>(context).email);
                    } catch (error) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(CustomSnackBar().customSnackBar(
                            'Oops', error.toString(), ContentType.failure));
                    }
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
                color: const Color(0xff572711),
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.75,
                redbl: 25,
                redbr: 25,
                redtl: 25,
                redtr: 25,
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const CircularProgressIndicator(
                        color: Colors.white,
                      );
                    } else {
                      return const Text(
                        "Log in ",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: kFontFamily,
                        ),
                      );
                    }
                  },
                ),
              ),
              const CustomAuthWithSocial()
            ],
          ),
        ),
      ),
    );
  }
}
