import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:coffe_shop/features/home/data/repos/Home_repo.dart';
import 'package:coffe_shop/features/home/data/repos/home_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  Timer? _debounce;
  final HomeRepo homeRepo = HomeRepoImplementation();
  Future getAllProducts({required String collectionName}) async {
    try {
      emit(ProductLoading());
      var data = await homeRepo.getAllProducts(collectionName: collectionName);
      data.fold(
        (l) {
          emit(ProductFailure(errMessage: l.errorMessage));
        },
        (r) {
          emit(ProductSuccess(products: r));
        },
      );
    } catch (e) {
      emit(ProductFailure(errMessage: e.toString()));
      log('e: $e');
    }
  }

  Future getProductsByCategory(
      {required String collectionName, required String category}) async {
    try {
      emit(ProductLoading());
      var data;
      if (category == 'All Coffee') {
        data = await homeRepo.getAllProducts(collectionName: collectionName);
      } else {
        data = await homeRepo.getProductsByCategory(
            collectionName: collectionName, category: category);
      }
      data.fold(
        (l) {
          emit(ProductFailure(errMessage: l.errorMessage));
        },
        (r) {
          emit(ProductSuccess(products: r));
        },
      );
    } catch (e) {
      log('e: $e');
    }
  }

  Future searchProduct(
      {required String collectionName, required String searchText}) async {
    emit(ProductLoading());
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    } else {
      _debounce = Timer(const Duration(milliseconds: 500), () async {
        try {
          var data;
          if (searchText == '') {
            data =
                await homeRepo.getAllProducts(collectionName: collectionName);
          } else {
            data = await homeRepo.searchProducts(
                collectionName: collectionName, searchText: searchText);
          }
          data.fold(
            (l) {
              emit(ProductFailure(errMessage: l.errorMessage));
            },
            (r) {
              emit(ProductSuccess(products: r));
            },
          );
        } catch (e) {
          log('e: $e');
        }
      });
    }
  }
}
