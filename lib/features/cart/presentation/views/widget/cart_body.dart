import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/core/widgets/custom_empty_widget.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/cart_item.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/custom_app_bar.dart';
import 'package:coffe_shop/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBody extends StatelessWidget {
  const CartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.03,
          right: MediaQuery.of(context).size.width * 0.04),
      child: ListView(
        children: [
          20.verticalSizedBox,
          const CustomAppBar(),
          25.verticalSizedBox,
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartSuccess) {
                return state.cartitem.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.cartitem.length,
                        itemBuilder: (context, index) =>
                            CartItem(cartmodel: state.cartitem[index]))
                    : const CustomEmptyWidget();
              } else if (state is CartFailure) {
                return Text(state.errormessage);
              } else if (state is CartLoading) {
                return const CircularProgressIndicator();
              } else if (state is CartDelete) {
                return const CustomEmptyWidget();
              } else {
                return cartitem.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cartitem.length,
                        itemBuilder: (context, index) =>
                            CartItem(cartmodel: cartitem[index]))
                    : const CustomEmptyWidget();
              }
            },
          ),
        ],
      ),
    );
  }
}
