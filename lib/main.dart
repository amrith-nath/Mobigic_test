import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigic_test/views/core/colors/colors.dart';
import 'package:mobigic_test/views/splash/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Mobigic demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: kWhite,
        appBarTheme: const AppBarTheme(backgroundColor: kBlack),
      ),
      home: const ScreenSplash(),
    );
  }
}
