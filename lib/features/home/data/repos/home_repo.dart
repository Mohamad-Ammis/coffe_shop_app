import 'package:coffe_shop/core/errors/failure.dart';
import 'package:coffe_shop/features/home/data/models/category_model.dart';
import 'package:coffe_shop/features/home/data/models/offer_product_model.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Faliure, List<CategoryModel>>> getAllCategories({required String collectionName});
  Future<Either<Faliure, List<OfferProductModel>>> getAllOffers({required String collectionName});
  Future<Either<Faliure, List<ProductModel>>> getAllProducts({required String collectionName});
  Future<Either<Faliure, List<ProductModel>>> getProductsByCategory({required String collectionName,required String category});
  Future<Either<Faliure, List<ProductModel>>> searchProducts({required String collectionName,required String searchText});
}
