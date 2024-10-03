String calculateStripePaymentAmountInCents({required num price}) {
  return((double.parse(price.toString()) * 100).toInt().toString());
}
