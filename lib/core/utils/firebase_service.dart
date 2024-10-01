import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getAllData(
      {required String collectionName,
      bool sortData = true,
      String sortKey = 'name'}) async {
    List<Map<String, dynamic>> docList = [];
    QuerySnapshot querySnapshot;
    if (sortData) {
      querySnapshot =
          await _firestore.collection(collectionName).orderBy(sortKey).get();
    } else {
      querySnapshot = await _firestore.collection(collectionName).get();
    }
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      docList.add(data);
    }
    log('***********************get data Successfully*********************: \n $docList');
    return docList;
  }

  Future<List<Map<String, dynamic>>> getProductsByCategory(
      {required String collcetionName, required String category}) async {
    List<Map<String, dynamic>> products = [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection(collcetionName)
          .where('category', isEqualTo: category)
          .get();
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        products.add(data);
      }
      log('products: $products');
    } catch (e) {
      log("Error retrieving products by category: $e");
    }
    return products;
  }
  //firebase dont allow use search with substring so i get all data and search in it
  Future<List<Map<String, dynamic>>> searchProducts({
    required String collectionName,
    required String searchText,
  }) async {
    QuerySnapshot querySnapshot =
        await _firestore.collection(collectionName).get();
    List<Map<String, dynamic>> products = [];
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      if (data['name']
          .toString()
          .toLowerCase()
          .contains(searchText.toLowerCase())) {
        products.add(data);
      }
    }
    log('products: $products');
    return products;
  }
}
