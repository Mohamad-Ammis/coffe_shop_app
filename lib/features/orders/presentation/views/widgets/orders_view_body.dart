import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/home_widgets/product_card.dart';
import 'package:coffe_shop/features/orders/presentation/views/widgets/order_card.dart';
import 'package:flutter/material.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMainPagePadding),
      child: Column(
        children: [OrderCard()],
      ),
    );
  }
}
