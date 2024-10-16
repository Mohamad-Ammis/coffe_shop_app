import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageCartItem extends StatelessWidget {
  final String imgurl ;
  const ImageCartItem({super.key, required this.imgurl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 7, top: 7, bottom: 7),
      width: MediaQuery.of(context).size.width * 0.3,
      height: 110,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child:CachedNetworkImage(
          placeholder: (context, url) =>const Center(child:  CircularProgressIndicator(color: Colors.black,)),
             imageUrl:  imgurl,
              fit: BoxFit.cover,
              errorWidget:(context, url, error) => const Icon(Icons.error),
           )
      ),
    );
  }
}
