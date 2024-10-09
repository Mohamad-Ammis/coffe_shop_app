class OfferProductModel {
  final dynamic id;
  final String image;

  OfferProductModel({required this.id,required this.image});
  factory OfferProductModel.fromJson(json) {
    return OfferProductModel(image: json['image'], id: json['id']);
  }
}
