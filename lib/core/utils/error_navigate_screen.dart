
import 'package:flutter/material.dart';

class NavigateErrorScreen extends StatelessWidget {
  const NavigateErrorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:  Text(
            'Some thing went wrong when try to open this page , please go back and try again'),
      ),
    );
  }
}
