import 'package:registerapp/models/catalog/catalog_model.dart';

abstract class CatalogRepository {
  
  Future<List<CatalogModel>> getCatalog();

}