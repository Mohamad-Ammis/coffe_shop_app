import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  final String image ;
  final void Function()? onTap;
  final Widget child ;
  const ImageButton({super.key, required this.image, this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: WidgetStatePropertyAll(Colors.white.withOpacity(0)),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
           color:const Color(0xffEAEAEA),
           borderRadius: BorderRadius.circular(25),
           border: Border.all(
            width: 1,
            color: Colors.white
           )
        ),
        height: MediaQuery.of(context).size.height*0.085,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width*0.38,
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.025 , horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(image,fit: BoxFit.contain,),
            child
          ],
        ),
      ),
    );
  }
}