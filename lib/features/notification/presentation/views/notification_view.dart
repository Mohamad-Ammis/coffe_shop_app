import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/widgets/custom_appbar.dart';
import 'package:coffe_shop/features/notification/presentation/views/widgets/notification_view_body.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: CustomAppbar(title: 'Notification'),
      body: NotificationViewBody(),
    );
  }
}
