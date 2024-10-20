import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/custom_snackpar.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/features/cart/data/model/item_cart_model.dart';
import 'package:coffe_shop/features/cart/presentation/cubit/cart_cubit/cart_cubit.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SizeDialog extends StatelessWidget {
  final ProductModel model ;
  const SizeDialog({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 160,
        width: MediaQuery.of(context).size.width*0.8,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 42,
                    width: 42,
                    child: Image.asset(
                      "assets/images/coffee.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  10.horizontalSizedBox,
                 const Text("Please choose size" , style: TextStyle(
                    fontFamily: kFontFamily,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),)
                ],
              ),
              15.verticalSizedBox,
              SizedBox(
                height:60 ,
                width:MediaQuery.of(context).size.width*0.5 ,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context , index)=>InkWell(
                    onTap: () {
                      CartModel cartModel = CartModel(
                        image: model.image,
                         description: model.description,
                         category: model.category,
                         averageRate: model.averageRate,
                         name: model.name,
                          size:index==0?"S":index==1?"M":"L" ,
                         price: model.price,
                         count: 1);
                        if(BlocProvider.of<CartCubit>(context).alreadyexist(cartModel)){
                          ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(CustomSnackBar().customSnackBar(
                            'Oops',"item already exist", ContentType.failure));
                        }else{
                          BlocProvider.of<CartCubit>(context).addlist(cartModel);
                        }
                      GoRouter.of(context).pop();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      margin:EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.02 , vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: kPrimaryColor,
                          width: 0.8
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(index==0?"S":index==1?"M":"L" , style:const TextStyle(
                        fontFamily: kFontFamily,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryColor
                      ),),
                    ),
                  )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
