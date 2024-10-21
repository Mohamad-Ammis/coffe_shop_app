import 'package:coffe_shop/constans.dart';
import 'package:flutter/material.dart';

class CustomCartButton extends StatelessWidget {
  final IconData iconData;
  final void Function()? ontap;
  final bool isicon;
  const CustomCartButton(
      {super.key, required this.iconData, this.ontap, required this.isicon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 27,
        width: 27,
        padding: !isicon ? const EdgeInsets.symmetric(horizontal: 6) : null,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: kPrimaryColor, width: 1),
        ),
        alignment: Alignment.center,
        child: isicon
            ? Icon(
                iconData,
                color: kPrimaryColor,
                size: 20,
              )
            : Image.asset(
                "assets/images/mini.png",
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}
