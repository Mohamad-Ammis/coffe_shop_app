import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getAllData(
      {required String collectionName,
      bool sortData = true,
      String sortKey = 'name',
      bool descending = false,
      String? whereKey,
      String? whereValue}) async {
    List<Map<String, dynamic>> docList = [];
    QuerySnapshot querySnapshot;
    if (sortData) {
      if (whereKey != null && whereValue != null) {
        querySnapshot = await _firestore
            .collection(collectionName)
            .orderBy(sortKey, descending: descending)
            .where(whereKey, isEqualTo: whereValue)
            .get();
      } else {
        querySnapshot = await _firestore
            .collection(collectionName)
            .orderBy(sortKey, descending: descending)
            .get();
      }
    } else {
      querySnapshot = await _firestore.collection(collectionName).get();
    }
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      data['id'] = doc.id;
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

  //SO FIRST WE WILL CHECK ON CATEGORY AND GET PRODUCTS DEPENDENT ON CATEGORY
  //THEN WE WILL FILTER IT , THATS IS DONT THE BEST CASE FOR COMPLEXITY BUT
  //WE CAN'T SEARCH IN STRING USING WHERE SO IF WE USE IT WE ONLY GET
  //THE PRODUCTS WHICH START WITH THE SEARCH TEXT AND THE UX SAY GET PRODUCT
  //WHICH CONTAIN THIS TEXT NOT ONLY START WITH
  Future<List<Map<String, dynamic>>> searchProducts(
      {required String collectionName,
      required String searchText,
      required String selectedCategory}) async {
    QuerySnapshot querySnapshot;
    if (selectedCategory == 'All Coffee') {
      querySnapshot = await _firestore.collection(collectionName).get();
    } else {
      querySnapshot = await _firestore
          .collection(collectionName)
          .where('category', isEqualTo: selectedCategory)
          .get();
    }

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

  Future<bool> add(
      {required String collectionName,
      required Map<String, dynamic> item}) async {
    await _firestore.collection(collectionName).add(item).then((value) {
      log('item added Successfully');
      return true;
    }).catchError((error) {
      log('Failed to add user: $error');
      return false;
    });
    return false;
  }
}
