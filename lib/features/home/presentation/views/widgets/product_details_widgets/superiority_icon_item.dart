import 'package:coffe_shop/constans.dart';
import 'package:flutter/material.dart';

class SuperiorityIconItem extends StatelessWidget {
  const SuperiorityIconItem({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      padding: const EdgeInsets.all(6),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
          color: kLightGreyColor, borderRadius: BorderRadius.circular(8)),
      child: Image.asset(image),
    );
  }
}
