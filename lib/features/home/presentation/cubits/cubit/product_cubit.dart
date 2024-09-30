import 'package:bloc/bloc.dart';
import 'package:coffe_shop/core/errors/failure.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:coffe_shop/features/home/data/repos/Home_repo.dart';
import 'package:coffe_shop/features/home/data/repos/home_repo_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  final HomeRepo homeRepo = HomeRepoImplementation();
  Future getAllProducts() async {
    try {
      emit(ProductLoading());
      var data = await homeRepo.getAllProducts();
      data.fold(
        (l) {
          emit(ProductFailure(errMessage: l.errorMessage));
        },
        (r) {
          emit(ProductSuccess(products: r));
        },
      );
    } catch (e) {
      // return Left(ServerFaliure(errorMessage: e.toString()));
    }
  }
}
