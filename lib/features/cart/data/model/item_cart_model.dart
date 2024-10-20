class CartModel {
  final String image;
  final String name;
  final num averageRate;
  final String description;
  final String category;
  final String? size;
  final num price;
  int count;

  CartModel(
      {required this.image,
      required this.averageRate,
      required this.category,
      required this.description,
      required this.name,
      required this.size,
      required this.price,
      required this.count});

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'rate_counts': count,
      'sizes': size,
      'price': price,
      'name': name,
      'average_rate': averageRate,
      'description': description,
      'category': category,
    };
  }
}
