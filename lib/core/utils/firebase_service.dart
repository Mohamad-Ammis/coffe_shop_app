import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffe_shop/core/errors/failure.dart';
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
}
