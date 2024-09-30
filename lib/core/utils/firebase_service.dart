import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop/core/errors/failure.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<Map<String, dynamic>>> getAllData(
      {required String collectionName}) async {
    List<Map<String, dynamic>> docList = [];
    QuerySnapshot querySnapshot =
        await _firestore.collection(collectionName).get();
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      docList.add(data);
    }
    log('***********************get data Successfully*********************: \n ${docList}');
    return docList;
  }

  Future<List<Map<String, dynamic>>> getProductsByCategory(
      {required String collcetionName,required String category}) async {
    List<Map<String, dynamic>> products = [];

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where('category', isEqualTo: category)
          .get();

      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        products.add(data);
      }
      log('products: ${products}');
    } catch (e) {
      print("Error retrieving products by category: $e");
    }

    return products;
  }
}
