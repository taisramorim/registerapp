class CatalogModelEntity {
  String id;
  String name;
  String description;
  String imageUrl;
  String category;

  CatalogModelEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
  });

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
      'category': category
    };
  }

  static CatalogModelEntity fromDocument(Map<String, dynamic> document) {
    return CatalogModelEntity(
      id: document['id'],
      name: document['name'],
      description: document['description'],
      imageUrl: document['imageUrl'],
      category: document['category'],
    );
  }
}