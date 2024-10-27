import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/features/home/presentation/views/widgets/home_widgets/custom_search_textfield.dart';
import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height / 6 * 2,
      padding: const EdgeInsets.all(kMainPagePadding),
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xff313131), Color(0xff111111)])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Welcome Back !',
            style: Styles.style14Regular.copyWith(
              color: Colors.white,
            ),
          ),
          Text(
            'in Caffeine',
            style: Styles.style18SemiBold.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          const CustomSearchTextFiled()
        ],
      ),
    );
  }
}
