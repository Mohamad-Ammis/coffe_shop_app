import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/core/utils/extensions.dart';
import 'package:coffe_shop/features/home/data/models/product_model.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/product_details_widgets/product_description_section.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/product_details_widgets/product_basic_info.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/product_details_widgets/sizes_list_view.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/product_details_widgets/superiority_icon_section.dart';
import 'package:flutter/material.dart';

class ProductDetailsInfo extends StatelessWidget {
  const ProductDetailsInfo({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //name ,rate, Superiority section
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProductBasicInfo(product: product),
            const SuperiorityIconsSection()
          ],
        ),
        const Divider(
          height: 32,
          indent: 20,
          color: Color(0xffE3E3E3),
          endIndent: 20,
        ),
        DescriptionSection(product: product),
        16.verticalSizedBox,
        const Text(
          'Sizes',
          style: Styles.style20SemiBold,
        ),
        16.verticalSizedBox,
        SizesListView(product: product),
        16.verticalSizedBox,
      ],
    );
  }
}
