import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/widgets/custom_appbar.dart';
import 'package:coffe_shop/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: CustomAppbar(
        title: 'My Orders',
      ),
      body: OrdersViewBody(),
    );
  }
}
