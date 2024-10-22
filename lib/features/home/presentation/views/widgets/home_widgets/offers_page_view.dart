import 'package:cached_network_image/cached_network_image.dart';
import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/features/home/data/models/offer_product_model.dart';
import 'package:flutter/material.dart';

class OffersPageView extends StatelessWidget {
  const OffersPageView(
      {super.key, required this.indicatoController, required this.offers});
  final PageController indicatoController;
  final List<OfferProductModel> offers;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 6,
      width: MediaQuery.sizeOf(context).width,
      margin: const EdgeInsets.all(0),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(0)),
      child: PageView.builder(
          controller: indicatoController,
          itemCount: offers.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 24),
                    child: CachedNetworkImage(
                      imageUrl: offers[index].image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => Container(
                          clipBehavior: Clip.hardEdge,
                          margin: const EdgeInsets.symmetric(
                              horizontal: kMainPagePadding),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child:
                              const Center(child: CircularProgressIndicator())),
                      errorWidget: (context, url, error) => Container(
                          clipBehavior: Clip.hardEdge,
                          margin: const EdgeInsets.symmetric(
                              horizontal: kMainPagePadding),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                              child: Icon(
                            Icons.error,
                            color: Colors.red,
                          ))),
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
