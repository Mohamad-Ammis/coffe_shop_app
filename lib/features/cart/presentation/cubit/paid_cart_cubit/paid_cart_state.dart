part of 'paid_cart_cubit.dart';

@immutable
sealed class PaidCartState {}

final class PaidCartInitial extends PaidCartState {}
final class PaidCartLoading extends PaidCartState {}
final class PaidCartFailure extends PaidCartState {
  final String errorMessage;

  PaidCartFailure({required this.errorMessage});
}
final class PaidCartSuccess extends PaidCartState {
  final bool check;

  PaidCartSuccess({required this.check});
}
