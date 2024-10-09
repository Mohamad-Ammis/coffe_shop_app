
import 'package:coffe_shop/features/orders/presentation/views/widgets/order_card_info_item.dart';
import 'package:flutter/material.dart';

class OrderCardInfoSection extends StatelessWidget {
  const OrderCardInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OrderCardInfoItem(
          title: 'Date',
          subTitle: '10 Aug 2022',
        ),
        SizedBox(
          width: 2,
          height: 30,
          child: VerticalDivider(),
        ),
        OrderCardInfoItem(
          title: 'Total Price',
          subTitle: r'123$',
        ),
      ],
    );
  }
}
