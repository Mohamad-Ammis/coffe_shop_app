import 'package:bloc/bloc.dart';
import 'package:coffe_shop/features/home/data/models/category_model.dart';
import 'package:coffe_shop/features/home/data/repos/Home_repo.dart';
import 'package:coffe_shop/features/home/data/repos/home_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';
class CategoryCubit extends Cubit<CategoryState> {
  final HomeRepo homeRepo = HomeRepoImplementation();

  CategoryCubit() : super(CategoryInitial());

  Future getAllCategories({required String collectionName}) async {
    try {
      emit(CategoryLoading());
      var data = await homeRepo.getAllCategories(collectionName: collectionName);
      data.fold((l) {
        emit(CategoryFailure(errMessage: l.errorMessage));
      }, (r) {
        emit(CategorySuccess(categories: r));
      });
    } catch (e) {
      emit(CategoryFailure(errMessage: e.toString()));
    }
  }

  // دالة لتبديل إظهار أو إخفاء قائمة التصنيفات
  void toggleCategoryVisibility() {
    if (state is CategorySuccess) {
      final currentState = state as CategorySuccess;
      emit(currentState.copyWith(showCategory: !currentState.showCategory));
    }
  }
}
