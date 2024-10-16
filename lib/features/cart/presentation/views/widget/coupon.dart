import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/features/Auth/presentation/views/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class Coupon extends StatelessWidget {
  const Coupon({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.57,
          child: CustomTextField(
            inputborder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: kPrimaryColor, width: 0.7)),
            hint: "Enter code",
            backgroundcolor: kBackgroundColor,
            hintcolor: Colors.black38,
            hintsize: MediaQuery.of(context).size.height * 0.018,
          ),
        ),
        7.horizontalSizedBox,
        CustomButton(
            redbl: 20,
            redbr: 20,
            redtl: 20,
            redtr: 20,
            color: kPrimaryColor,
            height: 57,
            width: MediaQuery.of(context).size.width * 0.21,
            child: const Text(
              "Apply",
              style: TextStyle(
                  fontFamily: kFontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ))
      ],
    );
  }
}
