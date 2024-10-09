
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/features/orders/presentation/views/widgets/order_card_header.dart';
import 'package:coffe_shop/features/orders/presentation/views/widgets/order_card_info_section.dart';
import 'package:flutter/material.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 20,
            spreadRadius: 2,
            color: Colors.blueGrey.withOpacity(.2))
      ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          OrderCardHeader(),
          22.verticalSizedBox,
          OrderCardInfoSection()
        ],
      ),
    );
  }
}
