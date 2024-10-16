import 'package:coffe_shop/constans.dart';
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
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: Text(
            'Order #${index + 1}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Styles.style16SemiBold,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(999)),
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
