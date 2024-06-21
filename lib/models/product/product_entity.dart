class ProductEntity {
  String productId;
  String name;
  String description;
  String imageUrl;
  String category;

  ProductEntity({
    required this.productId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
  });

  Map<String, Object?> toDocument() {
    return {
      'productId': productId,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'category': category
    };
  }

  static ProductEntity fromDocument(Map<String, dynamic> doc) {
    return ProductEntity(
      productId: doc['productId'],
      name: doc['name'],
      description: doc['description'],
      imageUrl: doc['imageUrl'],
      category: doc['category'],
    );
  }
}