import 'dart:developer';

import 'package:coffe_shop/core/errors/failure.dart';
import 'package:coffe_shop/core/utils/firebase_service.dart';
import 'package:coffe_shop/features/home/data/models/category_model.dart';
import 'package:coffe_shop/features/home/data/models/offer_product_model.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:coffe_shop/features/home/data/repos/Home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplementation implements HomeRepo {
  final FirebaseService firebaseService = FirebaseService();
  @override
  Future<Either<Faliure, List<ProductModel>>> getAllProducts(
      {required String collectionName}) async {
    try {
      var data =
          await firebaseService.getAllData(collectionName: collectionName);
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
  Future<Either<Faliure, List<ProductModel>>> getProductsByCategory(
      {required String collectionName, required String category}) async {
    try {
      var data = await firebaseService.getProductsByCategory(
          collcetionName: collectionName, category: category);
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
  Future<Either<Faliure, List<CategoryModel>>> getAllCategories(
      {required String collectionName}) async {
    try {
      var data =
          await firebaseService.getAllData(collectionName: collectionName);
      List<CategoryModel> categories = [];
      for (var category in data) {
        categories.add(CategoryModel.fromJson(category));
      }
      return Right(categories);
    } catch (e) {
      return Left(ServerFaliure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Faliure, List<OfferProductModel>>> getAllOffers(
      {required String collectionName}) async {
    try {
      var data = await firebaseService.getAllData(
          collectionName: collectionName, sortData: false);
      List<OfferProductModel> offers = [];
      for (var offer in data) {
        offers.add(OfferProductModel.fromJson(offer));
      }
      return Right(offers);
    } catch (e) {
      return Left(ServerFaliure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Faliure, List<ProductModel>>> searchProducts(
      {required String collectionName, required String searchText}) async {
    try {
      var data = await firebaseService.searchProducts(
          collectionName: collectionName, searchText: searchText);
      List<ProductModel> produtcs = [];
      for (var element in data) {
        produtcs.add(ProductModel.fromjson(element));
      }
      log('produtcs: ${produtcs}');
      return Right(produtcs);
    } catch (e) {
      return Left(ServerFaliure(errorMessage: e.toString()));
    }
  }
}
