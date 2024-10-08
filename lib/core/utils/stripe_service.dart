import 'dart:developer';

import 'package:coffe_shop/core/utils/api_keys.dart';
import 'package:coffe_shop/core/utils/api_service.dart';
import 'package:coffe_shop/features/checkout/data/models/customer_input_model.dart';
import 'package:coffe_shop/features/checkout/data/models/customer_model/customer_model.dart';
import 'package:coffe_shop/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:coffe_shop/features/checkout/data/models/init_payment_sheet_model.dart';
import 'package:coffe_shop/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:coffe_shop/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService;

  StripeService({required this.apiService});
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel model) async {
    var response = await apiService.post(
      contentType: 'application/x-www-form-urlencoded',
      url: 'https://api.stripe.com/v1/payment_intents',
      body: model.toJson(),
      token: ApiKeys.secretKey,
    );
    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required InitPaymentSheetModel model}) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      merchantDisplayName: 'Mohamad Ammis',
      customerEphemeralKeySecret: model.ephemeralKey,
      customerId: model.customerId,
      paymentIntentClientSecret: model.paymentIntentClientSecret,
    ));
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future createCustomer(CustomerInputModel customerModel) async {
    var response = await apiService.post(
        url: 'https://api.stripe.com/v1/customers',
        body: customerModel.toJson(),
        token: ApiKeys.secretKey);
    CustomerModel model = CustomerModel.fromJson(response.data);
    log('create customer : ${response.data}');
    return model;
  }

  Future getCustomer({required String email}) async {
    var response = await apiService.get(
        url: 'https://api.stripe.com/v1/customers?email=$email',
        token: ApiKeys.secretKey);
    if (response.data?['data']?[0] != null) {
      CustomerModel model = CustomerModel.fromJson(response.data['data'][0]);
      log('GET CUSTOMER : $model');
      return model;
    } else {
      throw Exception('un expected response when getCustomer data');
    }
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerid}) async {
    var response = await apiService.post(
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        body: {'customer': customerid},
        token: ApiKeys.secretKey,
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretKey}",
          "Stripe-Version": '2024-06-20'
        });
    EphemeralKeyModel model = EphemeralKeyModel.fromJson(response.data);
    return model;
  }

  Future makePayment({required PaymentIntentInputModel model}) async {
    var paymentIntentModel = await createPaymentIntent(model);
    var ephemeralKeyModel =
        await createEphemeralKey(customerid: model.customerId);
    InitPaymentSheetModel initPaymentSheetModel = InitPaymentSheetModel(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!,
        customerId: model.customerId,
        ephemeralKey: ephemeralKeyModel.secret);
    await initPaymentSheet(model: initPaymentSheetModel);
    await displayPaymentSheet();
  }
}
