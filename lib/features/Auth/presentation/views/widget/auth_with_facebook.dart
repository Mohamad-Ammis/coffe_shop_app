import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/custom_snackpar.dart';
import 'package:coffe_shop/features/Auth/presentation/views/widget/image_button.dart';
import 'package:flutter/material.dart';

class AuthWithFacebook extends StatelessWidget {
  const AuthWithFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageButton(
      onTap: () {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(CustomSnackBar().customSnackBar(
              'Oops', "don't exist in your country", ContentType.failure));
      },
      image: "assets/images/face.png",
      child: Text(
        "Facebook",
        style: TextStyle(
          fontFamily: kFontFamily,
          fontSize: MediaQuery.of(context).size.height * 0.018,
          color: Colors.black,
        ),
      ),
    );
  }
}
