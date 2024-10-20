import 'package:bloc/bloc.dart';
import 'package:coffe_shop/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:coffe_shop/features/checkout/data/repo/checkout_repo.dart';
import 'package:meta/meta.dart';

part 'stripe_cart_state.dart';

class StripeCartCubit extends Cubit<StripeCartState> {
  StripeCartCubit({required this.checkoutRepo}) : super(StripeCartInitial());

  final CheckoutRepo checkoutRepo;

  
  Future makePayment({required PaymentIntentInputModel model}) async {
    emit(StripeCartLoading());
    var data = await checkoutRepo.makePayment(model: model);
    data.fold((l) {
      emit(StripeCartFailure(errMessage: l.errorMessage));
    }, (r) {
      emit(StripeCartSuccess());
    });
  }


}
