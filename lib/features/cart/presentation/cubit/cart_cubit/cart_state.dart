part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}
final class CartLoading extends CartState {}
final class CartFailure extends CartState {
  final String errormessage;

  CartFailure({required this.errormessage});

}
final class CartSuccess extends CartState {
  final List<CartModel> cartitem ;

  CartSuccess({required this.cartitem});
}

final class Cartcount extends CartState {
  final int count ;

  Cartcount({required this.count});
}

final class CartDelete extends CartState {}
