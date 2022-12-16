import 'package:flutter/material.dart';
import 'package:mobigic_test/views/core/fonts/fonts.dart';

import '../colors/colors.dart';

class MyTheme {
  static var kThemeData = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: kWhite,
    appBarTheme: AppBarTheme(
      backgroundColor: kBlack,
      centerTitle: true,
      titleTextStyle: GoogleFont.appBarStyle,
    ),
  );
}
