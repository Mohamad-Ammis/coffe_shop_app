import 'package:coffe_shop/core/errors/failure.dart';
import 'package:coffe_shop/core/utils/firebase_service.dart';
import 'package:coffe_shop/features/Auth/data/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImp implements AuthRepo {
  final FirebaseService firebaseService;

  AuthRepoImp({required this.firebaseService});

  @override
  Future<Either<Failure, UserCredential>> signinfirebase(
      {required String email, required String password}) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      return left(firebasecatch(e));
    } catch (e) {
      return Left(ServerFaliure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signupfirebase(
      {required String email, required String password}) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      return left(firebasecatch(e));
    } catch (e) {
      return Left(ServerFaliure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signinwithgoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      return left(firebasecatch(e));
    } catch (e) {
      return Left(ServerFaliure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signinwithfacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      // Once signed in, return the UserCredential
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      return right(userCredential);
    } on FirebaseAuthException catch (e) {
      return left(firebasecatch(e));
    } catch (e) {
      return Left(ServerFaliure(errorMessage: e.toString()));
    }
  }

  ServerFaliure firebasecatch(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      return ServerFaliure(errorMessage: "weak-password");
    } else if (e.code == 'email-already-in-use') {
      return ServerFaliure(errorMessage: "email-already-in-use");
    } else if (e.code == 'invalid-email') {
      return ServerFaliure(errorMessage: "invalid-email");
    } else if (e.code == 'user-not-found') {
      return ServerFaliure(errorMessage: "user-not-found");
    } else if (e.code == 'wrong-password') {
      return ServerFaliure(errorMessage: "wrong-password");
    } else if (e.code == 'too-many-requests') {
      return ServerFaliure(errorMessage: "too-many-requests");
    } else if (e.code == 'operation-not-allowed') {
      return ServerFaliure(errorMessage: "operation-not-allowed");
    } else {
      return ServerFaliure(errorMessage: "${e.code}, try again");
    }
  }


}
