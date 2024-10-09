import 'package:coffe_shop/features/orders/data/models/order_model.dart';
import 'package:coffe_shop/features/orders/presentation/views/widgets/order_card.dart';
import 'package:flutter/material.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({
    super.key,
    required this.orders,
  });
  final List<OrderModel> orders;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: orders.length,
      itemBuilder: (context, index) {
        return OrderCard(order: orders[index], index: index,);
      },
    );
  }
}
