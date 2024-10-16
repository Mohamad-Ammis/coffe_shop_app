import 'package:flutter/material.dart';

class CustomIconButtontwo extends StatelessWidget {
  final double width;
  final IconData icon;
  final double size ;
  final void Function()? ontap ;
  const CustomIconButtontwo(
      {super.key,
      required this.width,
      required this.icon, required this.size, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:ontap ,
      child: SizedBox(
        width: width,
        child:  Icon(
          color:Colors.black,
          icon,
          size: size,
        ),
      ),
    );
  }
}
