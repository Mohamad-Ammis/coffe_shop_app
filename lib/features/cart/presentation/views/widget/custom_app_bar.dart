import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/custom_snackpar.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/delete_dialog.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/icon_button.dart';
import 'package:coffe_shop/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomIconButtontwo(
            ontap: () {
              GoRouter.of(context).pop();
            },
            width: 37,
            icon: Icons.arrow_back_ios_new_rounded,
            size: 25),
        const Spacer(),
        const Text(
          "Shopping Cart",
          style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: kFontFamily,
              fontWeight: FontWeight.bold,
              wordSpacing: 1.4),
        ),
        const Spacer(),
        CustomIconButtontwo(
          ontap: () {
            if (cartitem.isEmpty) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(CustomSnackBar().customSnackBar(
                    'Oops', "list is empty", ContentType.failure));
            } else {
              showDialog(
                  context: context, builder: (context) =>const DeleteDialog());
            }
          },
          width: 35,
          icon: Icons.delete_forever,
          size: 30,
        )
      ],
    );
  }
}
