import 'package:coffe_shop/features/Auth/presentation/views/widget/auth_with_social.dart';
import 'package:flutter/material.dart';

class CustomAuthWithSocial extends StatelessWidget {
  final double? top ;
  final double?bottom ;
  const CustomAuthWithSocial({super.key, this.top, this.bottom});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Padding(
          padding:  EdgeInsets.only(
           top:top?? MediaQuery.of(context).size.height*0.03 , bottom:bottom?? MediaQuery.of(context).size.height*0.03,
          ),
          child:const Row(
              children: [
               Expanded(child: Divider(
                    color: Colors.black45,
                    thickness: 0.8,
                  ),),
                Text("  Or continue with  " , style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54
                ),),
                Expanded(child: Divider(
                    color: Colors.black45,
                    thickness: 0.8,
                  ),)
              ],
            ),
        ),
       const AuthWithSocial()
      ],
    );
  }
}