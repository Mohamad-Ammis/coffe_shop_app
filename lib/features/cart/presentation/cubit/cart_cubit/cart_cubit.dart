import 'package:bloc/bloc.dart';
import 'package:coffe_shop/features/cart/data/model/item_cart_model.dart';
import 'package:coffe_shop/main.dart';
import 'package:meta/meta.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());


  num total_num(){
    num sum = 0;
    for(int i =0 ; i<cartitem.length ; i++){
      sum+=((cartitem[i].price)*(cartitem[i].count));
    }
    return sum ;
  }

 void addlist(CartModel cartmodel){
  emit(CartLoading());
  try{
   cartitem.add(cartmodel);
   emit(CartSuccess(cartitem: cartitem));
  }catch(errormessage){
    emit(CartFailure(errormessage: errormessage.toString()));
  }
 }

 void deletlist(){
   cartitem.clear();
   emit(CartDelete());
 }

 bool alreadyexist(CartModel cartmodel){
  for(int i = 0 ; i<cartitem.length ; i++){
      if(
        cartmodel.name ==cartitem[i].name&&
        cartmodel.image ==cartitem[i].image&&
        cartmodel.price == cartitem[i].price &&
        cartmodel.size == cartitem[i].size
      ){
        return true ;
      }
    }return false ;
 }

 void increaseitem(CartModel cartmodel){
   for(int i = 0 ; i<cartitem.length ; i++){
      if(
        cartmodel.name ==cartitem[i].name&&
        cartmodel.image ==cartitem[i].image&&
        cartmodel.price == cartitem[i].price &&
        cartmodel.size == cartitem[i].size
      ){
        cartitem[i].count +=1 ;
      }
      emit(Cartcount(count: cartitem[i].count));
   }
 }


 void minimizeitem(CartModel cartmodel){
   for(int i = 0 ; i<cartitem.length ; i++){
      if(
        cartmodel.name ==cartitem[i].name&&
        cartmodel.image ==cartitem[i].image&&
        cartmodel.price == cartitem[i].price &&
        cartmodel.size == cartitem[i].size
      ){
        cartitem[i].count -=1 ;
      }
      if(cartitem[i].count == 0){
        cartitem.removeAt(i);
      }
      emit(Cartcount(count: cartitem[i].count));
   }
 }
}
