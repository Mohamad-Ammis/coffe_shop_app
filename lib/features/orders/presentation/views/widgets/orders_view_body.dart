import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/features/orders/presentation/views/widgets/orders_list_view.dart';
import 'package:flutter/material.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(kMainPagePadding),
      child: OrdersListView(),
    );
  }
}
