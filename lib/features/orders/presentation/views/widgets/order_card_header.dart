
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class OrderCardHeader extends StatelessWidget {
  const OrderCardHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Order #1298',
          style: Styles.style16SemiBold,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(999)),
          padding:
              EdgeInsets.symmetric(horizontal: 22, vertical: 6),
          child: Text(
            'Paid',
            style:
                Styles.style14Regular.copyWith(color: Colors.white),
          ),
        )
      ],
    );
  }
}
