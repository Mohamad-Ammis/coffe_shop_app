
import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_style.dart';
import 'package:coffe_shop/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchTextFiled extends StatelessWidget {
  const CustomSearchTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 55,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xff313131), Color(0xff2A2A2A)]),
              borderRadius: BorderRadius.circular(10)),
          clipBehavior: Clip.hardEdge,
          width: MediaQuery.sizeOf(context).width / 1.5,
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            cursorColor: Colors.white,
            style: Styles.style14Regular.copyWith(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xff2A2A2A),
              hintText: 'Search coffee...',
              hintStyle:
                  Styles.style14Regular.copyWith(color: kLightSubTitleColor),
              prefixIcon: SvgPicture.asset(
                Assets.assetsImagesSearchIcon,
                width: 30,
                fit: BoxFit.scaleDown,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Container(
          decoration: BoxDecoration(
              color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(16),
          child: const Icon(
            Icons.filter_list,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
