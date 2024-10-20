import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/features/cart/data/model/item_cart_model.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/paid_cart_cubit/paid_cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:coffe_shop/core/utils/firebase_service.dart';
import 'package:coffe_shop/core/utils/functions/calculate_stripe_amounts_in_cents.dart';
import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/stripe_cart/stripe_cart_cubit.dart';
import 'package:coffe_shop/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:coffe_shop/features/orders/data/models/order_model.dart';
import 'package:coffe_shop/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      child: BlocConsumer<StripeCartCubit, StripeCartState>(
        listener: (BuildContext context, StripeCartState state) {
          if (state is StripeCartSuccess) {
            //if success => create order
            print("Your payment completed successfully");
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Your payment completed successfully")));
            FirebaseService firebaseService = FirebaseService();
            // for(int i =){}
            firebaseService.add(
                collectionName: kOrdersCollection,
                item: OrderModel(
                        clientId: userInfo!.getString('payment_token') ?? '',
                        currency: kPaymentCurrency,
                        price: BlocProvider.of<CartCubit>(context).totalNum(
                            BlocProvider.of<PaidCartCubit>(context).truecoupon),
                        totalItems:
                            BlocProvider.of<CartCubit>(context).totalcount(),
                        createdAt: DateTime.now().toString(),
                        products: products(cartitem),
                        status: 'Paid')
                    .toJson());
                    BlocProvider.of<CartCubit>(context).deletlist();
                    GoRouter.of(context).pop();
          } else if (state is StripeCartFailure) {
            print(state.errMessage);
            GoRouter.of(context).pop();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errMessage)));
          }
        },
        builder: (context, state) {
          return CustomButton(
              onPressed: state is StripeCartLoading
                  ? null
                  : () {
                      BlocProvider.of<StripeCartCubit>(context).makePayment(
                          model: PaymentIntentInputModel(
                              amount: calculateStripePaymentAmountInCents(
                                  price: BlocProvider.of<CartCubit>(context)
                                      .totalNum(BlocProvider.of<PaidCartCubit>(
                                              context)
                                          .truecoupon)),
                              currency: kPaymentCurrency,
                              customerId:
                                  userInfo!.getString('payment_token') ?? ''));
                    },
              redbl: 20,
              redbr: 20,
              redtl: 20,
              redtr: 20,
              color: kPrimaryColor,
              height: 55,
              width: MediaQuery.of(context).size.width * 0.9,
              child: state is StripeCartLoading
                  ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                  : const Text(
                      "CheckOut",
                      style: TextStyle(
                          fontFamily: kFontFamily,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ));
        },
      ),
    );
  }

  List<Map<String, dynamic>> products(List<CartModel> l) {
    List<Map<String, dynamic>> products = [];
    for (int i = 0; i < l.length; i++) {
      products.add(l[i].toJson());
    }
    return products;
  }
}
