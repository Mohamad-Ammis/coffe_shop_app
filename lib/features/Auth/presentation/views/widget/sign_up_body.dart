import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_routes.dart';
import 'package:coffe_shop/core/utils/custom_snackpar.dart';
import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/features/Auth/presentation/manger/register_cubit/register_cubit.dart';
import 'package:coffe_shop/features/Auth/presentation/views/widget/custom_auth_with_social.dart';
import 'package:coffe_shop/features/Auth/presentation/views/widget/custom_signup_fields.dart';
import 'package:coffe_shop/features/Auth/presentation/views/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final GlobalKey<FormState> formkey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(CustomSnackBar().customSnackBar('Oops',state.errorMessage, ContentType.failure));
        }else if(state is RegisterSuccess){
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
              title: "Creat an account",
              size: 25,
              alignment: Alignment.center,
              top: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            Form(
                autovalidateMode: autovalidateMode,
                key: formkey,
                child: const CustomSignupFields()),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            CustomButton(
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  try {
                    formkey.currentState!.save();
                    await BlocProvider.of<RegisterCubit>(context).register(
                        email: BlocProvider.of<RegisterCubit>(context).email,
                        password:
                            BlocProvider.of<RegisterCubit>(context).password);
                  } catch (error) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(CustomSnackBar().customSnackBar(
                          'Oops',
                          'password is\'t equal confirm password',
                          ContentType.failure));
                  }
                } else {
                  autovalidateMode = AutovalidateMode.always;
                }
              },
              color: const Color(0xff572711),
              height: MediaQuery.of(context).size.height * 0.065,
              width: MediaQuery.of(context).size.width * 0.75,
              redbl: 22,
              redbr: 22,
              redtl: 22,
              redtr: 22,
              child: BlocBuilder<RegisterCubit, RegisterState>(
                builder: (context, state) {
                  if (state is RegisterSuccess || state is RegisterFailure) {
                    return const Text(
                      "Sign Up ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: kFontFamily,
                      ),
                    );
                  }  else if (state is RegisterLoading) {
                    return const CircularProgressIndicator(color: Colors.white,);
                  } else {
                    return const Text(
                      "Sign Up ",
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
            CustomAuthWithSocial(
              top: MediaQuery.of(context).size.height * 0.02,
              bottom: MediaQuery.of(context).size.height * 0.02,
            )
          ],
        ),
      ),
    );
  }
}
