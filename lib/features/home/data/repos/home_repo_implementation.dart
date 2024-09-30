import 'package:coffe_shop/core/errors/failure.dart';
import 'package:coffe_shop/core/utils/firebase_service.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:coffe_shop/features/home/data/repos/Home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplementation implements HomeRepo {
  final FirebaseService firebaseService = FirebaseService();
  @override
  Future<Either<Faliure, List<ProductModel>>> getAllProducts() async {
    try {
      var data = await firebaseService.getAllData(collectionName: 'products');
        List<ProductModel> products = [];
          for (var product in data) {
            products.add(ProductModel.fromjson(product));
          }
          return Right(products);
    } catch (e) {
      return Left(ServerFaliure(errorMessage: e.toString()));
    }
  }
}
