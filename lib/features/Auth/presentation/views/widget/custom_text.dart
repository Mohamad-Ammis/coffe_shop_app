import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String title ;
  final AlignmentGeometry? alignment ;
  final double size ;
  final double? top ;
  final double? bottom ; 
  final double? left ;
  const CustomText({super.key, required this.title, this.alignment, required this.size, this.top, this.bottom, this.left});

  @override
  Widget build(BuildContext context) {
    return  Container(
          width: MediaQuery.of(context).size.width,
          alignment: alignment,
          padding: EdgeInsets.only(top:top?? 0 , bottom:bottom??0 , left:left??0 ),
          child: Text(
            title,
            style: GoogleFonts.openSans(
                color: const Color(0xff572711),
                fontSize: size,
                fontWeight: FontWeight.bold,
                wordSpacing: 1.4),
          ),
        );
  }
}