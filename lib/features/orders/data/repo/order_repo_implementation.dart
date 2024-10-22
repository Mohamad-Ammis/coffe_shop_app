import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/errors/failure.dart';
import 'package:coffe_shop/core/utils/firebase_service.dart';
import 'package:coffe_shop/features/orders/data/models/order_model.dart';
import 'package:coffe_shop/features/orders/data/repo/order_repo.dart';
import 'package:dartz/dartz.dart';

class OrderRepoImplementation implements OrderRepo {
  final FirebaseService firebaseService;

  OrderRepoImplementation({required this.firebaseService});
  @override
  Future<Either<Failure, List<OrderModel>>> getAllOrders() async {
    try {
      var data = await firebaseService.getAllData(
          collectionName: kOrdersCollection,
          sortData: true,
          sortKey: 'created_at',
          descending: true);
      List<OrderModel> orders = [];
      for (var order in data) {
        orders.add(OrderModel.fromJson(order));
      }
      return Right(orders);
    } on Exception catch (e) {
      return Left(ServerFaliure(errorMessage: e.toString()));
    }
  }
}
