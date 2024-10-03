import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/core/widgets/custom_loading_widget.dart';
import 'package:coffe_shop/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:coffe_shop/features/checkout/data/repo/checkout_repo_impl.dart';
import 'package:coffe_shop/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyProductSection extends StatelessWidget {
  const BuyProductSection({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      height: 100,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style:
                    Styles.style14Regular.copyWith(color: kLightSubTitleColor),
              ),
              6.verticalSizedBox,
              Text(
                r'$' '${product.price.toString()}',
                style: Styles.style18SemiBold.copyWith(color: kPrimaryColor),
              )
            ],
          ),
          34.horizontalSizedBox,
          //stripe payment integration
          BlocConsumer<CheckoutCubit, CheckoutState>(
            builder: (context, state) {
              return Expanded(
                child: GestureDetector(
                  onTap: state is CheckoutLoading
                      ? null
                      : () {
                          BlocProvider.of<CheckoutCubit>(context).makePayment(
                              model: PaymentIntentInputModel(
                                  amount: '100',
                                  currency: 'USD',
                                  customerId: 'cus_Qvws3ZErMXTMOI'));
                        },
                  child: Container(
                    height: 55,
                    padding: EdgeInsets.all(state is CheckoutLoading ? 0 : 16),
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: state is CheckoutLoading
                        ? const Center(
                            child: CustomLoadingWidget(
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            textAlign: TextAlign.center,
                            'Buy Now',
                            style: Styles.style16SemiBold
                                .copyWith(color: Colors.white),
                          ),
                  ),
                ),
              );
            },
            listener: (BuildContext context, CheckoutState state) {
              if (state is CheckoutSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Your payment completed successfully")));
              } else if (state is CheckoutFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errMessage)));
              }
            },
          )
        ],
      ),
    );
  }
}
