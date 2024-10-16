import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/coupon.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/details_paid.dart';
import 'package:flutter/material.dart';

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
                padding:  EdgeInsets.only(top: 15, left: 10),
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
              30.verticalSizedBox,
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 0.6,
                  color: Colors.black12,
                ),
              ),
              10.verticalSizedBox,
              const Detailspaid(title: "Sub total ", price: 5.95),
              const Detailspaid(title: "Delivery fees ", price: 5.95),
              const Detailspaid(title: "Total ", price: 5.95),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: CustomButton(
                    redbl: 20,
                    redbr: 20,
                    redtl: 20,
                    redtr: 20,
                    color: kPrimaryColor,
                    height: 55,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child:const Text(
                      "CheckOut",
                      style: TextStyle(
                          fontFamily: kFontFamily,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
              )
            ],
          )),
    );
  }
}

