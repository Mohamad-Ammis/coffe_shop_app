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
  String selectedCategory = 'All Coffee';

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
    }
    _debounce = Timer(const Duration(milliseconds: 500), () async {
      try {
        var data;
        log('category $selectedCategory');
        log('searchText $searchText');
        data = await homeRepo.searchProducts(
          collectionName: collectionName,
          searchText: searchText,
          selectedCategory: selectedCategory,
        );
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
        emit(ProductFailure(errMessage: e.toString()));
      }
    });
  }
}
/////// PAGINATION CODE 
/*
 List<ProductModel> items = [];

  DocumentSnapshot? lastDocument; 
  bool isLoading = false; 
  bool hasMoreData = true; 

  Future<void> fetch() async {
    if (isLoading || !hasMoreData) return;

    isLoading = true; 

    try {
      Query query = FirebaseFirestore.instance.collection('products').limit(1);
      if (lastDocument != null) {
        query = query.startAfterDocument(lastDocument!);
      }

      QuerySnapshot querySnapshot = await query.get();
      List<Map<String, dynamic>> newItems = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      if (newItems.isNotEmpty) {
        lastDocument = querySnapshot.docs.last; 
      } else {
        hasMoreData = false; 
      }
      List<ProductModel> temp = [];
      for (var element in newItems) {
        items.add(ProductModel.fromjson(element));
      }
      items.addAll(temp); 
      log('query: ${items.length.toString()}'); 
    } catch (e) {
      log('Error fetching data: $e');
    } finally {
      isLoading = false; 
    }
  }

*/ 