import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final Widget child;
  final double? redtl;
  final double? redtr;
  final double? redbl;
  final double? redbr;
  final void Function()? onPressed;

  const CustomButton(
      {super.key,
      required this.color,
      required this.height,
      required this.width,
      required this.child,
      this.onPressed,
      this.redtl,
      this.redtr,
      this.redbl,
      this.redbr});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              // side: const BorderSide(width: 0.3, color: Colors.black54),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(redtl ?? 0),
                  topRight: Radius.circular(redtr ?? 0),
                  bottomLeft: Radius.circular(redtl ?? 0),
                  bottomRight: Radius.circular(redbr ?? 0)))),
          overlayColor: WidgetStatePropertyAll(Colors.white.withOpacity(0)),
          backgroundColor: WidgetStatePropertyAll(color),
        ),
        child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          child: child,
        ));
  }
}
