import 'package:coffe_shop/core/errors/failure.dart';
import 'package:coffe_shop/core/utils/firebase_service.dart';
import 'package:coffe_shop/features/home/data/models/category_model.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:coffe_shop/features/home/data/repos/Home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplementation implements HomeRepo {
  final FirebaseService firebaseService = FirebaseService();
  @override
  Future<Either<Faliure, List<ProductModel>>> getAllProducts({required String collectionName}) async {
    try {
      var data = await firebaseService.getAllData(collectionName: collectionName);
        List<ProductModel> products = [];
          for (var product in data) {
            products.add(ProductModel.fromjson(product));
          }
          return Right(products);
    } catch (e) {
      return Left(ServerFaliure(errorMessage: e.toString()));
    }
  }
  
  @override
  Future<Either<Faliure, List<ProductModel>>> getProductsByCategory({required String collectionName, required String category}) async {
   try {
      var data = await firebaseService.getProductsByCategory(collcetionName: collectionName,category: category);
        List<ProductModel> products = [];
          for (var product in data) {
            products.add(ProductModel.fromjson(product));
          }
          return Right(products);
    } catch (e) {
      return Left(ServerFaliure(errorMessage: e.toString()));
    }
  }
  
  @override
  Future<Either<Faliure, List<CategoryModel>>> getAllCategories({required String collectionName}) async {
    try {
      var data = await firebaseService.getAllData(collectionName: collectionName);
        List<CategoryModel> categories = [];
          for (var category in data) {
            categories.add(CategoryModel.fromJson(category));
          }
          return Right(categories);
    } catch (e) {
      return Left(ServerFaliure(errorMessage: e.toString()));
    }
  }
}
