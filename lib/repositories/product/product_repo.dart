import 'package:registerapp/models/product/product_model.dart';

abstract class ProductRepository {
  
  Future<List<Product>> getProducts();

}