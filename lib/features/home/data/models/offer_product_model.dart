class OfferProductModel {
  final String image;

  OfferProductModel({required this.image});
  factory OfferProductModel.fromJson(json) {
    return OfferProductModel(image: json['image']);
  }
}
