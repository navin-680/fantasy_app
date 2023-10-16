import 'package:aivoks_fantasy_app/custom_widgets/rich_text_widgets.dart';
import 'package:aivoks_fantasy_app/res/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashScreen());
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1600), () {
      Get.offAllNamed("/intro");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: RichTextsWidget.richText(
                  text1: "Powered by ",
                  fontSize1: 14.0,
                  fontWeight1: FontWeight.w500,
                  color1: MyColors.black,
                  text2: " Aivoks Technologies Pvt Ltd",
                  fontSize2: 14.0,
                  fontWeight2: FontWeight.w700,
                  color2: MyColors.white,
                )),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
