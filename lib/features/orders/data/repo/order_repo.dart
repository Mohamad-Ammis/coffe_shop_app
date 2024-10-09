import 'package:coffe_shop/core/errors/failure.dart';
import 'package:coffe_shop/features/orders/data/models/order_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderRepo {
  Future<Either<Failure, List<OrderModel>>> getAllOrders();
}
