
class OrderModel {
  final String clientId;
  final String currency;
  final num price;
  final num totalItems;
  final String createdAt;
  final String status;
  final List<Map<String, dynamic>> products;

  OrderModel(
      {required this.clientId,
      required this.status, 
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
      "status":status,
      "products":products
    };
  }
}
