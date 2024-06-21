class CatalogModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String category;

  CatalogModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.category,
  });

  CatalogModel toEntity() {
    return CatalogModel(
      id: id,
      name: name,
      description: description,
      imageUrl: imageUrl,
      category: category,
    );
  }

  static CatalogModel fromEntity(CatalogModel entity) {
    return CatalogModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      imageUrl: entity.imageUrl,
      category: entity.category,
    );
  }
}