class CartModel {
  final String image;
  final String name;
  final String? size;
  final num price;
  int count;

  CartModel(
      {required this.image,
      required this.name,
      required this.size,
      required this.price,
      required this.count});
}
