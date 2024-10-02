
import 'package:coffe_shop/core/utils/assets.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/product_details_widgets/superiority_icon_item.dart';
import 'package:flutter/material.dart';

class SuperiorityIconsSection extends StatelessWidget {
  const SuperiorityIconsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SuperiorityIconItem(
          image: Assets.assetsImagesDelivery,
        ),
        SuperiorityIconItem(
          image: Assets.assetsImagesBean,
        ),
        SuperiorityIconItem(
          image: Assets.assetsImagesMilk,
        )
      ],
    );
  }
}
