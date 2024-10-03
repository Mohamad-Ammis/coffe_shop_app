import 'package:coffe_shop/core/errors/failure.dart';
import 'package:coffe_shop/features/home/data/models/category_model.dart';
import 'package:coffe_shop/features/home/data/models/offer_product_model.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<CategoryModel>>> getAllCategories({required String collectionName});
  Future<Either<Failure, List<OfferProductModel>>> getAllOffers({required String collectionName});
  Future<Either<Failure, List<ProductModel>>> getAllProducts({required String collectionName});
  Future<Either<Failure, List<ProductModel>>> getProductsByCategory({required String collectionName,required String category});
  Future<Either<Failure, List<ProductModel>>> searchProducts({required String collectionName,required String selectedCategory, required String searchText});
}
