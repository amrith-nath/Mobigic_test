import 'package:flutter/material.dart';
import 'package:mobigic_test/views/core/constants/constants.dart';
import 'package:mobigic_test/views/core/fonts/fonts.dart';

import 'widgets/input_card_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
      ),
      body: Column(
        children: [
          kHeight,
          SizedBox(
            width: 300,
            child: Text(
              'Enter the Number of Rows, Columns and The Alphabets',
              style: GoogleFont.homeHeadStyle,
              textAlign: TextAlign.center,
            ),
          ),
          kHeight,
          InputCardWidget(),
        ],
      ),
    );
  }
}
