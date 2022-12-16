import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigic_test/views/core/colors/colors.dart';
import 'package:mobigic_test/views/screen_splash/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kWhite,
      ),
      home: ScreenSplash(),
    );
  }
}
