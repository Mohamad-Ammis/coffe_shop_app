import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/widgets/custom_bottom_navbar.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      backgroundColor: kBackgroundColor,
      resizeToAvoidBottomInset: false,
      body: HomeViewBody(),
    );
  }
}
