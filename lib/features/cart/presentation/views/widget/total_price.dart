import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/paid_cart_cubit/paid_cart_cubit.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/details_paid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaidCartCubit, PaidCartState>(
      builder: (context, state) {
        if (state is PaidCartSuccess) {
          if (state.check) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                        fontFamily: kFontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      Text(
                        "${(BlocProvider.of<CartCubit>(context).totalNum(false) + 1.05).toStringAsFixed(3)} \$",
                        style: const TextStyle(
                            fontFamily: kFontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      6.horizontalSizedBox,
                      const Icon(
                        Icons.arrow_forward,
                        size: 20,
                        color: Colors.black,
                      ),
                      6.horizontalSizedBox,
                      Text(
                        "${(BlocProvider.of<CartCubit>(context).totalNum(BlocProvider.of<PaidCartCubit>(context).truecoupon)).toStringAsFixed(3)} \$",
                        style: const TextStyle(
                            fontFamily: kFontFamily,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Detailspaid(
                title: "Total ",
                price: (BlocProvider.of<CartCubit>(context).totalNum(
                            BlocProvider.of<PaidCartCubit>(context)
                                .truecoupon) +
                        1.05)
                    .toStringAsFixed(3));
          }
        }
        return Detailspaid(
            title: "Total ",
            price: (BlocProvider.of<CartCubit>(context).totalNum(
                        BlocProvider.of<PaidCartCubit>(context).truecoupon) +
                    1.05)
                .toStringAsFixed(3));
      },
    );
  }
}
