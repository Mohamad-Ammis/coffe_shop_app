import 'package:bloc/bloc.dart';
import 'package:coffe_shop/features/home/data/models/category_model.dart';
import 'package:coffe_shop/features/home/data/repos/Home_repo.dart';
import 'package:coffe_shop/features/home/data/repos/home_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  final HomeRepo homeRepo = HomeRepoImplementation();
  Future getAllCategories({required String collectionName}) async {
    try {
      emit(CategoryLoading());
      var data =
          await homeRepo.getAllCategories(collectionName: collectionName);
      data.fold((l) {
        emit(CategoryFailure(errMessage: l.errorMessage));
      }, (r) {
        emit(CategorySuccess(categories: r));
      });
    } catch (e) {
      emit(CategoryFailure(errMessage: e.toString()));
    }
  }
}
