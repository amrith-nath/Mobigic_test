import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigic_test/views/core/theme/theme.dart';
import 'package:mobigic_test/views/splash/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobigic demo',
      theme: MyTheme.kThemeData,
      home: const ScreenSplash(),
    );
  }
}
