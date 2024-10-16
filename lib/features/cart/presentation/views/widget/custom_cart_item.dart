import 'package:coffe_shop/features/cart/data/model/item_cart_model.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/details_cart-item.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/image_cart_item.dart';
import 'package:flutter/material.dart';


class CustomCartItem extends StatelessWidget {
  final CartModel cartmodel ;
  const CustomCartItem({super.key, required this.cartmodel});

  @override
  Widget build(BuildContext context) {
    return  Row(
          children: [
            ImageCartItem(
            imgurl: cartmodel.image,
           ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 7),
                child: DetailsCartItem(cartmodel: cartmodel,)
              ),
            )
          ],
        );
  }
}