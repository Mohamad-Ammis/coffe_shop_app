import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 180,
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Container(
                margin:const EdgeInsets.symmetric(horizontal: 10),
                child:const Text(
                  "Are you sure about deleting the list? ",
                  style: TextStyle(
                      fontFamily: kFontFamily,
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 1.4),
                  textAlign: TextAlign.center,
                ),
              ),
              25.verticalSizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                      onPressed: () {
                        BlocProvider.of<CartCubit>(context).deletlist();
                        GoRouter.of(context).pop();
                      },
                      redbl: 20,
                      redbr: 20,
                      redtl: 20,
                      redtr: 20,
                      color: kPrimaryColor,
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: const Text(
                        "Yes",
                        style: TextStyle(
                            fontFamily: kFontFamily,
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                  CustomButton(
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      redbl: 20,
                      redbr: 20,
                      redtl: 20,
                      redtr: 20,
                      color: kPrimaryColor,
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                            fontFamily: kFontFamily,
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
