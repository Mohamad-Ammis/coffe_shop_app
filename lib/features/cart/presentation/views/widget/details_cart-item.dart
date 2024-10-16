import 'package:coffe_shop/features/cart/data/model/item_cart_model.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/custom_details_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/extensions.dart';

class DetailsCartItem extends StatelessWidget {
  final CartModel cartmodel ;
  const DetailsCartItem({super.key, required this.cartmodel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         Text(
          cartmodel.name,
          style:const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              fontFamily: kFontFamily),
        ),
        5.verticalSizedBox,
       CustomDetailsCartItem(cartmodel: cartmodel,),
        7.verticalSizedBox,
         Text(
          "${cartmodel.price} \$",
          style:const TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontFamily: kFontFamily,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
