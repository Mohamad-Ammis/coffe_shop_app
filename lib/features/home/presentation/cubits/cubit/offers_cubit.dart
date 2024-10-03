import 'package:bloc/bloc.dart';
import 'package:coffe_shop/features/home/data/models/offer_product_model.dart';
import 'package:coffe_shop/features/home/data/repos/Home_repo.dart';
import 'package:coffe_shop/features/home/data/repos/home_repo_implementation.dart';
import 'package:meta/meta.dart';

part 'offers_state.dart';

class OffersCubit extends Cubit<OffersState> {
  OffersCubit({required this.homeRepo}) : super(OffersInitial());
  final HomeRepo homeRepo;
  Future getAllOffers(
      {required String collectionName}) async {
    try {
      emit(OffersLoading());
      var data = await homeRepo.getAllOffers(collectionName: collectionName);
      data.fold((l) {
        emit(OffersFailure(errMessage: l.errorMessage));
      }, (offers) {
        emit(OffersSuccess(offers: offers));
      });
    } catch (e) {
      emit(OffersFailure(errMessage: e.toString()));
    }
  }
}
