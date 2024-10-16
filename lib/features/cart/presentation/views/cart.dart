import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/cart_body.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/check_out_part.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CheckOutPart(),
      backgroundColor: kBackgroundColor,
      body: CartBody()
    );
  }
}