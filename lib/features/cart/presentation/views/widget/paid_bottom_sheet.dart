import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/paid_cart_cubit/paid_cart_cubit.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/check_coupon.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/check_out_button.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/coupon.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/details_paid.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaidBottomSheet extends StatelessWidget {
  const PaidBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).viewInsets.bottom == 0 ? 430 : 650,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: kBackgroundColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Padding(
          padding: EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 15, left: 10),
                child: Text(
                  "Discount Coupon",
                  style: TextStyle(
                      fontFamily: kFontFamily,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              25.verticalSizedBox,
              const Coupon(),
              const CheckCoupon(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 0.6,
                  color: Colors.black12,
                ),
              ),
              10.verticalSizedBox,
              Detailspaid(
                  title: "Sub total ",
                  price: (BlocProvider.of<CartCubit>(context).totalNum(
                          BlocProvider.of<PaidCartCubit>(context).truecoupon))
                      .toStringAsFixed(3)),
              const Detailspaid(title: "Delivery fees ", price: "1.05"),
              const TotalPrice(),
              const CheckOutButton()
            ],
          )),
    );
  }
}
