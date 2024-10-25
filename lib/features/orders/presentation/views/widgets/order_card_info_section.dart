import 'package:flutter/material.dart';
import 'package:coffe_shop/features/orders/data/models/order_model.dart';
import 'package:coffe_shop/features/orders/presentation/views/widgets/order_card_info_item.dart';

class OrderCardInfoSection extends StatelessWidget {
  const OrderCardInfoSection({
    super.key,
    required this.order,
  });
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OrderCardInfoItem(
          title: 'Date',
          subTitle: order.createdAt,
        ),
        const SizedBox(
          width: 2,
          height: 30,
          child: VerticalDivider(),
        ),
        OrderCardInfoItem(
          title: 'Total Price',
          subTitle: '${order.price.toStringAsFixed(2)}\$',
        ),
      ],
    );
  }
}
