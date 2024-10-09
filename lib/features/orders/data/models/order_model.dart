
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
  
  factory OrderModel.fromJson(json) {
    // List<ProductModel> temp = [];
    // for (var element in json['products']) {
    //   temp.add(ProductModel.fromjson(element));
    // }
    return OrderModel(
        clientId: json['client_id'],
        status: json['status'],
        currency: json['currency'],
        price: json['price'],
        totalItems: json['total_items'],
        createdAt: json['created_at'],
        products: json['products']);
  }
}
