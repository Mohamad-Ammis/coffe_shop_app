import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/features/Auth/presentation/views/widget/custom_text_field.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/paid_cart_cubit/paid_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/custom_snackpar.dart';

class Coupon extends StatefulWidget {
  const Coupon({super.key});

  @override
  State<Coupon> createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  String? coupon;
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.55,
          child: Form(
            key: formkey,
            child: CustomTextField(
              iscoupon: true,
              inputborder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(color: kPrimaryColor, width: 0.7)),
              hint: "Enter code",
              backgroundcolor: kBackgroundColor,
              hintcolor: Colors.black38,
              hintsize: MediaQuery.of(context).size.height * 0.018,
              onsaved: (data) {
                coupon = data;
                BlocProvider.of<PaidCartCubit>(context).setcoupon(c: coupon!);
              },
            ),
          ),
        ),
        (MediaQuery.of(context).size.width * 0.01).horizontalSizedBox,
       
        CustomButton(
            onPressed: () async {
              if (formkey.currentState!.validate()) {
                try {
                  formkey.currentState!.save();
                  await BlocProvider.of<PaidCartCubit>(context)
                      .checkcoupon(coupon: coupon!);
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
            redbl: 20,
            redbr: 20,
            redtl: 20,
            redtr: 20,
            color: kPrimaryColor,
            height: 57,
            width: MediaQuery.of(context).size.width * 0.21,
            child: BlocBuilder<PaidCartCubit, PaidCartState>(
              builder: (context, state) {
                if (state is PaidCartLoading) {
                  return const CircularProgressIndicator(
                    color: Colors.white,
                  );
                } else {
                  return const Text(
                    "Apply",
                    style: TextStyle(
                        fontFamily: kFontFamily,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  );
                }
              },
            ))
      ],
    );
  }
}
