import 'package:bloc/bloc.dart';
import 'package:coffe_shop/features/cart/presentation/views/cart.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/home_widgets/home_view_body.dart';
import 'package:coffe_shop/features/orders/presentation/views/order_view.dart';
import 'package:flutter/material.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);
    final List<Widget> screens = [
      const HomeViewBody(),
      const OrderView(),
      const Cart(), 
      const HomeViewBody(), 
    ];

  // Method to change the tab index
  void changeTab(int index) {
    emit(index);
  }
}
