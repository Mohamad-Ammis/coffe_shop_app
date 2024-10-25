import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/widgets/custom_error_widget.dart';
import 'package:coffe_shop/features/orders/presentation/cubits/cubit/get_orders_cubit.dart';
import 'package:coffe_shop/features/orders/presentation/views/widgets/orders_list_view.dart';
import 'package:coffe_shop/features/orders/presentation/views/widgets/orders_loading_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersViewBody extends StatelessWidget {
  const OrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMainPagePadding),
      child: BlocBuilder<GetOrdersCubit, GetOrdersState>(
        builder: (context, state) {
          if (state is GetOrdersSuccess) {
            return OrdersListView(
              orders: state.orders,
            );
          } else if (state is GetOrdersFailure) {
            return CustomErrorWidget(errMessage: state.errMessage);
          } else {
            return const OrdersLoadingListView();
          }
        },
      ),
    );
  }
}
