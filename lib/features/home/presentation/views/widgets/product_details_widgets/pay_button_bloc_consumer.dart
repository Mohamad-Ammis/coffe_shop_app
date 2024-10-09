import 'dart:developer';

import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/features/orders/data/models/order_model.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/core/utils/firebase_service.dart';
import 'package:coffe_shop/core/utils/functions/calculate_stripe_amounts_in_cents.dart';
import 'package:coffe_shop/core/widgets/custom_loading_widget.dart';
import 'package:coffe_shop/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:coffe_shop/features/checkout/presentation/cubit/checkout_cubit.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:coffe_shop/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PayButtonBlocConsumer extends StatelessWidget {
  const PayButtonBlocConsumer({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        return Expanded(
          child: GestureDetector(
            onTap: state is CheckoutLoading
                ? null
                : () {
                    log(product.price.toString());
                    BlocProvider.of<CheckoutCubit>(context).makePayment(
                        model: PaymentIntentInputModel(
                            amount: calculateStripePaymentAmountInCents(
                                price: product.price),
                            currency: kPaymentCurrency,
                            customerId:
                                userInfo!.getString('payment_token') ?? ''));
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
                      style:
                          Styles.style16SemiBold.copyWith(color: Colors.white),
                    ),
            ),
          ),
        );
      },
      listener: (BuildContext context, CheckoutState state) {
        if (state is CheckoutSuccess) {
          //if success => create order
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("Your payment completed successfully")));
          FirebaseService firebaseService = FirebaseService();
          firebaseService.add(
              collectionName: kOrdersCollection,
              item: OrderModel(
                  clientId: userInfo!.getString('payment_token') ?? '',
                  currency: kPaymentCurrency,
                  price: product.price,
                  totalItems: 1,
                  createdAt: DateTime.now().toString(),
                  products: [product.toJson()], status: 'Paid').toJson());
        } else if (state is CheckoutFailure) {
          log(state.errMessage);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
    );
  }
}
