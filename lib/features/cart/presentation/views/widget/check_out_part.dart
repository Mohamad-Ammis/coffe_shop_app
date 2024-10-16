import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/paid_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutPart extends StatelessWidget {
  const CheckOutPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black38, width: 0.3),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        height: 100,
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: Styles.style14Regular
                      .copyWith(color: kLightSubTitleColor),
                ),
                6.verticalSizedBox,
                BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    return Text(
                      r'$' '${BlocProvider.of<CartCubit>(context).totalNum()}',
                      style:
                          Styles.style18SemiBold.copyWith(color: kPrimaryColor),
                    );
                  },
                )
              ],
            ),
            const Spacer(),
            CustomButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      backgroundColor: kBackgroundColor,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      builder: (context) => const PaidBottomSheet());
                },
                color: kPrimaryColor,
                height: 55,
                width: 200,
                redbl: 20,
                redbr: 20,
                redtl: 20,
                redtr: 20,
                child: const Text(
                  "CheckOut",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: kFontFamily,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 1.4),
                )),
          ],
        ),
      ),
    );
  }
}
