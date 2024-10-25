import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/service_locator.dart';
import 'package:coffe_shop/core/utils/wavy_cliper.dart';
import 'package:coffe_shop/core/widgets/custom_appbar.dart';
import 'package:coffe_shop/features/orders/data/repo/order_repo_implementation.dart';
import 'package:coffe_shop/features/orders/presentation/cubits/cubit/get_orders_cubit.dart';
import 'package:coffe_shop/features/orders/presentation/views/widgets/orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          ClipPath(
            clipper: WavyClipper(),
            child: Container(
              color: kPrimaryColor,
              height: 350,
            ),
          ),
          Column(
            children: [
              const CustomAppbar(
                title: 'My Orders',
                hasBackIcon: false,
                backgroundColor: Colors.transparent,
                titleColor: Colors.white,
              ),
              Expanded(
                child: BlocProvider(
                  create: (context) => GetOrdersCubit(
                    orderRepo: getIt.get<OrderRepoImplementation>(),
                  )..getAllOrders(),
                  child: const OrdersViewBody(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
