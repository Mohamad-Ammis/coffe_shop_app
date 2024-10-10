import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteInitial());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> getFavorites() async {
    try {
      emit(FavoriteLoading());
      User? currentUser = _auth.currentUser;
      if (currentUser == null) throw Exception("No user signed in");

      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .collection('favorites')
          .get();

      List<ProductModel> favorites = snapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;
        return ProductModel.fromjson(data);
      }).toList();

      log('favorites: $favorites');

      try {
  emit(FavoriteSuccess(favorites));
} on StateError catch (e) {
  log('e: $e');
}
    } catch (e) {
      try {
  emit(FavoriteFailure(e.toString()));
} on StateError catch (e) {
  log('e: $e');
}
    }
  }

  Future<void> addToFavorites(ProductModel product) async {
    try {
      emit(FavoriteLoading());
      User? currentUser = _auth.currentUser;
      if (currentUser == null) throw Exception("No user signed in");

      await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .collection('favorites')
          .doc(product.id.toString())
          .set(product.toJson());

      getFavorites();
    } catch (e) {
      try {
  emit(FavoriteFailure(e.toString()));
} on StateError catch (e) {
  log('e: $e');
}
    }
  }

  Future<void> removeFromFavorites(ProductModel product) async {
    try {
      emit(FavoriteLoading());
      User? currentUser = _auth.currentUser;
      if (currentUser == null) throw Exception("No user signed in");

      await _firestore
          .collection('users')
          .doc(currentUser.uid)
          .collection('favorites')
          .doc(product.id.toString())
          .delete();

      getFavorites();
    } catch (e) {
      try {
  emit(FavoriteFailure(e.toString()));
} on StateError catch (e) {
  log('e: $e');
}
    }
  }

  Future<bool> isFavorite(ProductModel product) async {
    User? currentUser = _auth.currentUser;
    if (currentUser == null) return false;

    DocumentSnapshot doc = await _firestore
        .collection('users')
        .doc(currentUser.uid)
        .collection('favorites')
        .doc(product.id.toString())
        .get();

    return doc.exists;
  }

  @override
  Future<void> close() {
    log('close////////////*12312****3111111111111113');
    return super.close();
  }
}
