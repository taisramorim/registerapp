import 'package:registerapp/models/product/product_entity.dart';

class Product {
  final String productId;
  final String name;
  final String description;
  final String imageUrl;
  final String category;

  Product({
    required this.productId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
  });

  ProductEntity toEntity() {
    return ProductEntity(
      productId: productId,
      name: name,
      description: description,
      imageUrl: imageUrl,
      category: category,
    );
  }

  static Product fromEntity(ProductEntity entity) {
    return Product(
      productId: entity.productId,
      name: entity.name,
      description: entity.description,
      imageUrl: entity.imageUrl,
      category: entity.category,
    );
  }
}