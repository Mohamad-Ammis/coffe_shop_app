
import 'package:coffe_shop/features/orders/presentation/views/widgets/order_card.dart';
import 'package:flutter/material.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return const OrderCard();
      },
    );
  }
}
