import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop/core/errors/failure.dart';
import 'package:coffe_shop/features/cart/data/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CartRepoImp implements CartRepo{
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Future<Either<Failure, bool>> checkCoupon({required String coupon})async {
   try {
      User? currentUser = _auth.currentUser;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('user').doc(currentUser!.uid).get();

  if (userDoc.exists) {
    List<dynamic> coupons = userDoc.get('coupons'); // جلب قائمة الكوبونات

    if (coupons.contains(coupon)) {
      log("Coupon is valid for this user");
       return right(true);
    } else {
      log("Coupon not found for this user");
      return left(ServerFaliure(errorMessage: "Coupon not Valid"));
    }
  } else {
    log("User does not exist");
    return left(ServerFaliure(errorMessage: "Coupon not Valid"));
  }
    }catch (e) {
      return Left(ServerFaliure(errorMessage: "something error , try again"));
    }
  }

  @override
  Future<Either<Failure, bool>> paidCart() {
    // 
    throw UnimplementedError();
  }
}