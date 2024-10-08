import 'package:coffe_shop/features/Auth/presentation/manger/login_cubit/login_cubit.dart';
import 'package:coffe_shop/features/Auth/presentation/views/widget/custom_text.dart';
import 'package:coffe_shop/features/Auth/presentation/views/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomLoginFields extends StatefulWidget {
  const CustomLoginFields({super.key});

  @override
  State<CustomLoginFields> createState() => _CustomLoginFieldsState();
}

class _CustomLoginFieldsState extends State<CustomLoginFields> {
  String? email ;

  String? password ;

  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           CustomText(
            title: "E_Mail",
            size: 18,
            top: 10,
            left: MediaQuery.of(context).size.height * 0.013,
            bottom: MediaQuery.of(context).size.height * 0.01,
          ),
          CustomTextField(
            isemail: true,
            onsaved: (data) {
              email = data ;
              BlocProvider.of<LoginCubit>(context).setloginemail(n: email!);
            },
            hint: "   Enter Username",
            backgroundcolor: const Color(0xffF5F5F5),
            hintcolor: const Color(0xff010101).withOpacity(0.0),
            hintsize: MediaQuery.of(context).size.height * 0.019,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.015,
          ),
          CustomText(
            title: "Password",
            size: 18,
            left: 10,
            top: MediaQuery.of(context).size.height * 0.013,
            bottom: MediaQuery.of(context).size.height * 0.01,
          ),
          CustomTextField(
            ispass: true,
            onsaved: (data) {
              password = data ;
              BlocProvider.of<LoginCubit>(context).setloginpassword(p: password!);
            },
            obscureText: true,
            hint: "   Enter Username",
            backgroundcolor: const Color(0xffF5F5F5),
            hintcolor: const Color(0xff010101).withOpacity(0.0),
            hintsize: MediaQuery.of(context).size.height * 0.019,
          ),
        ],
    );
  }
}