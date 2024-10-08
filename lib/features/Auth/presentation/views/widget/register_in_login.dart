import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterInLogin extends StatelessWidget {
  const RegisterInLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "or create an account ? ",
              style: GoogleFonts.montserrat(
                color: Colors.black45,
                fontSize: 12,
              ),
            ),
            InkWell(
              overlayColor: WidgetStatePropertyAll(Colors.white.withOpacity(0)),
              onTap: () => GoRouter.of(context).push(AppRouter.ksignupView),
              child: const Text(
                "Register",
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff572711),
                    fontFamily: kFontFamily,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        );
  }
}