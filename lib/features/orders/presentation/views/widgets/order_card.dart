import 'package:coffe_shop/constans.dart';
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
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
          border: Border.all(width: .2, color: kLightSubTitleColor),
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          const OrderCardHeader(),
          22.verticalSizedBox,
          const OrderCardInfoSection()
        ],
      ),
    );
  }
}
