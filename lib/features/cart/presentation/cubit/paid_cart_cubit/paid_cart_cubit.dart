import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop/features/cart/data/repo/cart_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'paid_cart_state.dart';

class PaidCartCubit extends Cubit<PaidCartState> {
  PaidCartCubit({required this.cartRepo}) : super(PaidCartInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CartRepo cartRepo;
  

  String? coupon;

  bool truecoupon = false ;



  void test()async{
    try {
    //  emit(FavoriteLoading());
      User? currentUser = _auth.currentUser;
      if (currentUser == null) print("nouser");
      else{
         CollectionReference users = _firestore.collection('user');
      await users
      .doc(currentUser.uid)
      .set({
        'coupons': FieldValue.arrayUnion(["Areej516"])
      });
      print("saved okkkk");
      }
    }catch(error){
      print(error);
    }}

    void test2()async{
      User? currentUser = _auth.currentUser;
      DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('user').doc(currentUser!.uid).get();

  if (userDoc.exists) {
    List<dynamic> coupons = userDoc.get('coupons'); // جلب قائمة الكوبونات

    if (coupons.contains("Areej55")) {
      print("Coupon is valid for this user");
      // return true; // الكوبون موجود
    } else {
      print("Coupon not found for this user");
      // return false; // الكوبون غير موجود
    }
  } else {
    print("User does not exist");
    // return false; // المستخدم غير موجود
  }
    }

    Future<void> checkcoupon({required String coupon})async{
    emit(PaidCartLoading());
      var result = await cartRepo.checkCoupon(coupon: coupon);
      result.fold((failure){
        truecoupon = false ;
        emit(PaidCartFailure(errorMessage: failure.errorMessage));
      }, (success){
        if(success){
          truecoupon = true;
          emit(PaidCartSuccess(check: true));
        }else{
          truecoupon = false ;
          emit(PaidCartFailure(errorMessage: "Coupon not Valid"));
        }
      });
   } 


   void setcoupon({required String c}){
    coupon = c ;
   }

   void dispose(){
    truecoupon = false ;
    emit(PaidCartInitial());
   }

}
