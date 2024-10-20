import 'package:coffe_shop/constans.dart';
import 'package:flutter/material.dart';

class Detailspaid extends StatelessWidget {
  final String title;
  final String price;
  const Detailspaid({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:const TextStyle(
                fontFamily: kFontFamily,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Text(
            "$price \$",
            style:const TextStyle(
                fontFamily: kFontFamily,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          )
        ],
      ),
    );
  }
}
