import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/features/orders/data/models/order_model.dart';
import 'package:flutter/material.dart';

class OrderCardHeader extends StatelessWidget {
  const OrderCardHeader({
    super.key,
    required this.order,
    required this.index,
  });
  final OrderModel order;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Order #${index + 1}',
          style: Styles.style16SemiBold,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(999)),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
          child: Text(
            order.status.toString(),
            style: Styles.style14Regular.copyWith(color: Colors.white),
          ),
        )
      ],
    );
  }
}
