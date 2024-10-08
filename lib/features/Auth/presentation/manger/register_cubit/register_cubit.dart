import 'package:bloc/bloc.dart';
import 'package:coffe_shop/features/Auth/data/repo/auth_repo.dart';
import 'package:coffe_shop/main.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo ;
  
  String password = "";
  String email  = "";

  Future<void> register({required String email , required String password})async{
    emit(RegisterLoading());
    var result = await authRepo.signupfirebase(email: email, password: password); 
    result.fold(
      (failure){
        emit(RegisterFailure(errorMessage: failure.errorMessage));
      }, (success){
        userInfo!.setBool("user" , true);
        emit(RegisterSuccess());
      });

  }

  void setregisteremail({required String n}){
    email = n ;
  }

   void setregisterpassword({required String p}){
    password = p ;
  }

}
