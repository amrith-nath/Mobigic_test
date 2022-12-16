import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigic_test/views/home/screen_home.dart';

import '../core/colors/colors.dart';
import '../core/fonts/fonts.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startNavigate();
    });

    return Scaffold(
      body: Center(
        child: TextLiquidFill(
          waveDuration: const Duration(seconds: 1),
          text: 'Mobigic',
          boxBackgroundColor: kWhite,
          waveColor: kButtonColor,
          textStyle: GoogleFont.splashStyle,
        ),
      ),
    );
  }

  startNavigate() async {
    await Future.delayed(const Duration(seconds: 6));
    Get.off(
      () => const ScreenHome(),
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 600),
    );
  }
}
