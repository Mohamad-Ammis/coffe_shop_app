import 'package:bloc/bloc.dart';
import 'package:coffe_shop/features/Auth/data/repo/auth_repo.dart';
import 'package:coffe_shop/main.dart';
import 'package:meta/meta.dart';

part 'google_sign_in_state.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  GoogleSignInCubit(this.authRepo) : super(GoogleSignInInitial());
  final AuthRepo authRepo;

  Future<void> signingoogle() async {
    emit(GoogleSignInLoading());
    var result =
        await authRepo.signinwithgoogle();
    result.fold((failure) {
      emit(GoogleSignInFailure(errorMessage: failure.errorMessage));
    }, (success) {
     userInfo!.setBool("user" , true);
      emit(GoogleSignInSuccess());
    });
  }
}
