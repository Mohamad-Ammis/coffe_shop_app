import 'package:coffe_shop/constans.dart';
import 'package:coffe_shop/core/utils/app_routes.dart';
import 'package:coffe_shop/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
            ),
            Opacity(
              opacity: 0.7,
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/on_boarding.jpg",
                    fit: BoxFit.fill,
                  )),
            ),
            Positioned(
                bottom: 40,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.1),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child:const Text(
                          "Fall in Love with Coffee in Blissful Delight",
                          style: TextStyle(
                              fontFamily: kFontFamily,
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              wordSpacing: 1.3),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05),
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          "Welcome to our cozy coffe corner, where every cup is delightful for you ",
                          style: TextStyle(
                              fontFamily: kFontFamily,
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 15,
                              wordSpacing: 1.3),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 20,),
                      CustomButton(
                        onPressed: () => GoRouter.of(context).push(AppRouter.kLoginView),
                        color: const Color(0xffC67C4F),
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.75,
                        redbl: 20,
                        redbr: 20,
                        redtl: 20,
                        redtr: 20,
                        child:const Text("Get Started " , style:  TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: kFontFamily,
                        ),),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
