import 'dart:developer';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/core/utils/custom_snackpar.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/paid_cart_cubit/paid_cart_cubit.dart';
import 'package:coffe_shop/features/cart/presentation/views/widget/paid_bottom_sheet.dart';
import 'package:coffe_shop/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckOutPart extends StatelessWidget {
  const CheckOutPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      // elevation: 10,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        // height: 100,
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
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
                    log(state.toString());
                    if (state is CartSuccess ||
                        state is CartInitial ||
                        state is CartDelete) {
                      return Text(
                        r'$'
                        '${(BlocProvider.of<CartCubit>(context).totalNum(BlocProvider.of<PaidCartCubit>(context).truecoupon) + 0.0).toStringAsFixed(2)}',
                        style: Styles.style18SemiBold
                            .copyWith(color: kPrimaryColor),
                      );
                    } else {
                      return Text(
                        r'$'
                        '${(BlocProvider.of<CartCubit>(context).totalNum(BlocProvider.of<PaidCartCubit>(context).truecoupon) + 1.05).toStringAsFixed(2)}',
                        style: Styles.style18SemiBold
                            .copyWith(color: kPrimaryColor),
                      );
                    }
                  },
                )
              ],
            ),
            const Spacer(),
            CustomButton(
                onPressed: () {
                  if (cartitem.isEmpty) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(CustomSnackBar().customSnackBar(
                          'Oops', "List is empty", ContentType.failure));
                  } else {
                    showModalBottomSheet(
                            context: context,
                            backgroundColor: kBackgroundColor,
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            builder: (context) => const PaidBottomSheet())
                        .then((data) {
                      // ignore: use_build_context_synchronously
                      BlocProvider.of<PaidCartCubit>(context).dispose();
                    });
                  }
                },
                color: kPrimaryColor,
                height: 55,
                width: MediaQuery.of(context).size.width * 0.45,
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
