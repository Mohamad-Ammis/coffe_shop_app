import 'package:coffe_shop/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
   Future<Either<Failure,UserCredential>> signinfirebase({required String email , required String password});
   Future<Either<Failure,UserCredential>> signupfirebase({required String email , required String password});
   Future<Either<Failure,UserCredential>> signinwithgoogle();
   Future<Either<Failure,UserCredential>> signinwithfacebook();
}
