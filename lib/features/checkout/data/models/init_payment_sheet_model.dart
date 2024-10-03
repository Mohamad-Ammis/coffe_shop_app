class InitPaymentSheetModel {
  final String paymentIntentClientSecret;
  final String? ephemeralKey;
  final String? customerId;

  InitPaymentSheetModel({required this.paymentIntentClientSecret,  this.ephemeralKey,  this.customerId});
  
}
