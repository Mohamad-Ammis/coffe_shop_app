import 'package:coffe_shop/core/widgets/custom_error_widget.dart';
import 'package:coffe_shop/features/home/presentation/cubits/cubit/offers_cubit.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/offers_card_indicator.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/offers_loading_widget.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/offers_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OffersSection extends StatefulWidget {
  const OffersSection({super.key});

  @override
  State<OffersSection> createState() => _OffersSectionState();
}

class _OffersSectionState extends State<OffersSection> {
  final PageController indicatoController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OffersCubit, OffersState>(
      builder: (context, state) {
        if (state is OffersSuccess) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height / 6,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              alignment: Alignment.center,
              children: [
                OffersPageView(
                  offers: state.offers,
                  indicatoController: indicatoController,
                ),
                Positioned.fill(
                    top: -120,
                    child: Align(
                      child: OffersCardIndicator(
                        offers: state.offers,
                        indicatorController: indicatoController,
                      ),
                    ))
              ],
            ),
          );
        } else if (state is OffersFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const OffersLoadingWidget();
        }
      },
    );
  }
}
