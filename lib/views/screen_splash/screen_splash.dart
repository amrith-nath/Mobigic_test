import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../core/colors/colors.dart';
import '../core/fonts/fonts.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  Widget build(BuildContext context) {
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
}
