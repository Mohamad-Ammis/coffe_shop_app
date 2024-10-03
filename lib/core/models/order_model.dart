
class OrderModel {
  final String clientId;
  final String currency;
  final num price;
  final num totalItems;
  final String createdAt;
  final List<Map<String, dynamic>> products;

  OrderModel(
      {required this.clientId,
      required this.currency,
      required this.price,
      required this.totalItems,
      required this.createdAt,
      required this.products});

  toJson() {
    return {
      'client_id': clientId,
      'price': price,
      "currency": currency,
      "total_items": totalItems,
      "created_at": DateTime.now().toString(),
      "products":products
      //  [
      //   {
      //     'name': 'product',
      //     'category ': 'Espresso',
      //     'description': 'desc',
      //     'image ': 'image',
      //     'price': 19,
      //     'average_rate': 2.1,
      //     'rate_counts': 12,
      //     'sizes ': ["s", "m", "l"]
      //   },
      //   {}
      // ]
    };
  }
}
