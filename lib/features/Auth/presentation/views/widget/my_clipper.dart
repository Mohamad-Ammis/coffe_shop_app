import 'package:flutter/material.dart';
import 'dart:math' as math;

class MyClipper extends CustomClipper<Path>{

  final double radius;
  MyClipper({required this.radius});
  
  @override
  Path getClip(Size size) {
    return Path()
    ..lineTo(0, 2*radius)
    ..arcTo(
      Rect.fromCircle(center: Offset(radius, 2*radius), radius: radius), 
      math.pi, 
      math.pi/2, 
      false
    )
    ..lineTo(radius, radius)
    ..lineTo(size.width-radius, radius)
    ..arcTo(
      Rect.fromCircle(center: Offset(size.width-radius, 0), radius: radius), 
      math.pi/2, 
      -math.pi/2, 
      false
    )
    ..lineTo(size.width, size.height)
    ..lineTo(0, size.height)
    ..close()
    ;
  }
  
  @override
  bool shouldReclip(MyClipper oldClipper) {
    return false;
  }
}