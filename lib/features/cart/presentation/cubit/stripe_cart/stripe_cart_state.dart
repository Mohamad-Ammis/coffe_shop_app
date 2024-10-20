part of 'stripe_cart_cubit.dart';

@immutable
sealed class StripeCartState {}

final class StripeCartInitial extends StripeCartState {}
final class StripeCartLoading extends StripeCartState {}
final class StripeCartFailure extends StripeCartState {
  final String errMessage;

  StripeCartFailure({required this.errMessage});
}
final class StripeCartSuccess extends StripeCartState {}
