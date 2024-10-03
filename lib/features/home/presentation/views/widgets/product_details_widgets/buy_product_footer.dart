import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/product_details_widgets/pay_button_bloc_consumer.dart';
import 'package:flutter/material.dart';
class BuyProductSection extends StatelessWidget {
  const BuyProductSection({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      height: 100,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style:
                    Styles.style14Regular.copyWith(color: kLightSubTitleColor),
              ),
              6.verticalSizedBox,
              Text(
                r'$' '${product.price.toString()}',
                style: Styles.style18SemiBold.copyWith(color: kPrimaryColor),
              )
            ],
          ),
          34.horizontalSizedBox,
          //stripe payment integration
           PayButtonBlocConsumer(product: product,)
        ],
      ),
    );
  }
}
