import 'package:coffe_shop/features/cart/data/model/item_cart_model.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/custom_cart_item.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final CartModel cartmodel;
  const CartItem({super.key, required this.cartmodel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
          height: 110,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: CustomCartItem(cartmodel: cartmodel)),
    );
  }
}
