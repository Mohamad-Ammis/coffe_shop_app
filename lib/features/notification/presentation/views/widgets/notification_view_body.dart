import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/widgets/custom_empty_widget.dart';
import 'package:flutter/material.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(kMainPagePadding),
      child: CustomEmptyWidget(
        title: "You dont have any missed notification",
      ),
    );
  }
}
