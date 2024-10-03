class CustomerInputModel {
  final String? name;
  final String? phone;
  final String? description;
  final String? email;
  final String? paymentMethod;
  final String? coupon;

  CustomerInputModel(
      {this.name,
      this.phone,
      this.description,
      this.email,
      this.paymentMethod,
      this.coupon});

  /// u can use more dependents on your requirments and all fields is on docs
  /// on https://docs.stripe.com/api/customers/create
  ///
  toJson() {
    return {
      'name': name,
      'phone': phone,
      'description': description,
      'email': email,
      'paymentMethod': paymentMethod,
      'coupon': coupon
    };
  }
}
