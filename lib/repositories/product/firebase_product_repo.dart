import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registerapp/models/product/product_model.dart';
import 'package:registerapp/models/product/product_entity.dart';


import 'product_repo.dart';

class FirebaseProductRepository implements ProductRepository {
  final productCollection = FirebaseFirestore.instance.collection('products');

  @override
  Future<List<Product>> getProducts() async {
    try {
      return await productCollection
        .get()
        .then((value) => value.docs.map((e) => 
          Product.fromEntity(ProductEntity.fromDocument(e.data()))
        ).toList());
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}