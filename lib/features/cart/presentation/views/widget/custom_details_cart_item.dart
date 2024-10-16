import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/features/cart/data/model/item_cart_model.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/cart_button.dart';
import 'package:flutter/material.dart';

class CustomDetailsCartItem extends StatelessWidget {
  final CartModel cartmodel;
  const CustomDetailsCartItem({super.key, required this.cartmodel});

  @override
  Widget build(BuildContext context) {
    return  Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                5.verticalSizedBox,
                 Text(
                  "Size : ${cartmodel.size}",
                  style:const TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                      fontFamily: kFontFamily),
                ),
                5.verticalSizedBox,
              ],
            ),
           const Spacer(),
           CartButton(cartmodel: cartmodel,)
          ],
        );
  }
}