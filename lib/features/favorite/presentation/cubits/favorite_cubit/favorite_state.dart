part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final List<ProductModel> favorites;
  FavoriteSuccess(this.favorites);
}

class FavoriteFailure extends FavoriteState {
  final String error;
  FavoriteFailure(this.error);
}
