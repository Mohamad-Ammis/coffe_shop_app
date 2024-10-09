import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coffe_shop/features/orders/data/models/order_model.dart';
import 'package:coffe_shop/features/orders/data/repo/order_repo.dart';
import 'package:meta/meta.dart';

part 'get_orders_state.dart';

class GetOrdersCubit extends Cubit<GetOrdersState> {
  final OrderRepo orderRepo;
  GetOrdersCubit({required this.orderRepo}) : super(GetOrdersInitial());
  
  Future getAllOrders() async {
    try {
      emit(GetOrdersLoading());
      var data = await orderRepo.getAllOrders();
      data.fold((fail) {
        emit(GetOrdersFailure(errMessage: fail.errorMessage));
      }, (success) {
        emit(GetOrdersSuccess(orders: success));
      });
    } catch (e) {
      emit(GetOrdersFailure(errMessage: e.toString()));
    }
  }

  @override
  void onChange(Change<GetOrdersState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
