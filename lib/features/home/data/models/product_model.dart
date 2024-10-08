class ProductModel {
  final dynamic id;
  final String image;
  final num rateCounts;
  final List<String> sizes;
  final num price;
  final String name;
  final num averageRate;
  final String description;
  final String category;

  ProductModel({
    required this.id,
    required this.image,
    required this.rateCounts,
    required this.sizes,
    required this.price,
    required this.name,
    required this.averageRate,
    required this.description,
    required this.category,
  });

  factory ProductModel.fromjson(Map<String, dynamic> data) {
    return ProductModel(
      image: data['image'] ?? '',
      rateCounts: data['rate_counts'] ?? 0,
      sizes: List<String>.from(data['sizes'] ?? []),
      price: data['price'] ?? 0.0,
      name: data['name'] ?? '',
      averageRate: data['average_rate'] as num? ?? 0.0,
      description: data['description'] ?? '',
      category: data['category'] ?? '',
      id: data['id'],
    );
  }

  // تحويل من Product إلى Map
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'rate_counts': rateCounts,
      'sizes': sizes,
      'price': price,
      'name': name,
      'average_rate': averageRate,
      'description': description,
      'category': category,
    };
  }
}
