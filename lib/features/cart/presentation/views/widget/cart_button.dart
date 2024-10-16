import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/features/cart/data/model/item_cart_model.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/custom_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartButton extends StatelessWidget {
  final CartModel cartmodel;
  const CartButton({super.key, required this.cartmodel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Row(
        children: [
          CustomCartButton(
            iconData: Icons.add,
            isicon: true,
            ontap: () {
             BlocProvider.of<CartCubit>(context).increaseitem(cartmodel);
            },
          ),
          Text(
             "  ${cartmodel.count}  ",
                style: const TextStyle(
                    fontSize: 15, color: Colors.black, fontFamily: kFontFamily),
              ),
          CustomCartButton(
            ontap: () {
             BlocProvider.of<CartCubit>(context).minimizeitem(cartmodel);
            },
            iconData: Icons.minimize_rounded,
            isicon: false,
          )
        ],
      ),
    );
  }
}
