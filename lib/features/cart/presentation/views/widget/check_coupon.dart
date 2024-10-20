import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/paid_cart_cubit/paid_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckCoupon extends StatelessWidget {
  const CheckCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                padding: const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width,
                height: 30,
                alignment: Alignment.center,
                child: BlocBuilder<PaidCartCubit, PaidCartState>(
                  builder: (context, state) {
                    if (state is PaidCartFailure) {
                      return const Text(
                        "coupon is not valid",
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.black54,
                          fontFamily: kFontFamily,
                        ),
                      );
                    } else if (state is PaidCartSuccess) {
                      if (state.check) {
                        return const Text(
                          "coupon is valid",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.black54,
                            fontFamily: kFontFamily,
                          ),
                        );
                      } else {
                        return const Text("");
                      }
                    } else {
                      return const Text("");
                    }
                  },
                ),
              );
  }
}