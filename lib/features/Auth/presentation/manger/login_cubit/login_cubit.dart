import 'package:bloc/bloc.dart';
import 'package:coffe_shop/features/Auth/data/repo/auth_repo.dart';
import 'package:coffe_shop/main.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());

  final AuthRepo authRepo ;

  String password = "";
  String email  = "";

  Future<void> login({required String email , required String password})async{
    emit(LoginLoading());
    var result = await authRepo.signinfirebase(email: email, password: password); 
    result.fold(
      (failure){
        emit(LoginFailure(errorMessage: failure.errorMessage));
      }, (success){
        userInfo!.setBool("user" , true);
        emit(LoginSuccess());
      });

  }

  void setloginemail({required String n}){
    email = n ;
  }

   void setloginpassword({required String p}){
    password = p ;
  }


}
