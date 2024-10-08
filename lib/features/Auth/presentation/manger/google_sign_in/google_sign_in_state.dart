part of 'google_sign_in_cubit.dart';

@immutable
sealed class GoogleSignInState {}

final class GoogleSignInInitial extends GoogleSignInState {}
final class GoogleSignInLoading extends GoogleSignInState {}
final class GoogleSignInFailure extends GoogleSignInState {
  final String errorMessage ;

  GoogleSignInFailure({required this.errorMessage});
}
final class GoogleSignInSuccess extends GoogleSignInState {}
