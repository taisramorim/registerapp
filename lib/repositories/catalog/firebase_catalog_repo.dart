import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:registerapp/models/catalog/catalog_model.dart';
import 'package:registerapp/models/catalog/catalog_model_entity.dart';


import 'catalog_repo.dart';

class FirebaseCatalogRepository implements CatalogRepository {
  final catalogCollection = FirebaseFirestore.instance.collection('catalog');

 
  @override
  Future<List<CatalogModel>> getCatalog() async {
    try {
      return await catalogCollection
          .get()
          .then((value) => value.docs
          .map((e) => CatalogModel.fromEntity(CatalogModelEntity.fromDocument(e.data()) as CatalogModel))
          .toList());
    } catch (e) {
      log(e.toString());
      rethrow;      
    }
  }
}