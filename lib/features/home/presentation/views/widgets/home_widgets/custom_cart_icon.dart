
import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomCartIcon extends StatelessWidget {
  const CustomCartIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: kMainPagePadding,
        top: kMainPagePadding + 20,
        child: InkWell(
          onTap: () => GoRouter.of(context).push(AppRouter.kCartPage)/*  print(userInfo!.getString("payment_token")) */,
          child: const SizedBox(
            height: 40,
            width: 40,
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 30,
              color: Colors.white,
            ),
          ),
        ));
  }
}
