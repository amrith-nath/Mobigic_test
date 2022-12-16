import 'package:flutter/material.dart';

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
          InputCardWidget(),
        ],
      ),
    );
  }
}
