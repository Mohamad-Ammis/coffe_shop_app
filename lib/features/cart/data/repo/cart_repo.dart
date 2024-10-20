import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class CartRepo {
  Future<Either<Failure,bool>> checkCoupon({required String coupon});
   Future<Either<Failure,bool>> paidCart();
}