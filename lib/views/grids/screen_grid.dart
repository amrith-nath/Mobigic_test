import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigic_test/controllers/grid_controller/grid_controller.dart';
import 'package:mobigic_test/views/core/constants/constants.dart';

import '../core/colors/colors.dart';
import '../core/fonts/fonts.dart';

class Screengrid extends StatelessWidget {
  Screengrid({
    super.key,
    required this.alphabets,
    required this.columns,
    required this.rows,
  });
  final String alphabets;
  final int rows;
  final int columns;
  final TextEditingController _textEditingController = TextEditingController();
  final GridController gridController = Get.put(GridController());
  @override
  Widget build(BuildContext context) {
    List<String> alphaLists = alphabets.split('');
    var vList = gridController.createVertices(alphaLists, rows, columns);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Play Ground',
        ),
      ),
      body: Column(
        children: [
          kHeight,
          Card(
            child: inpiutWidget(
                label: 'Play text',
                controller: _textEditingController,
                onChange: (text) {
                  gridController.stringList.value = text;
                  gridController.getIds();
                  log(gridController.vertexIdsFnl.length.toString());
                }),
          ),
          kHeight,
          Expanded(
            flex: 1,
            child: GridView.builder(
              itemCount: rows * columns,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: rows),
              itemBuilder: (context, index) => Obx(
                () => Card(
                  color: gridController.vertexIdsFnl.contains(index)
                      ? kDarkGreen
                      : gridController.stringList.contains(alphaLists[index])
                          ? kRed
                          : kBlue,
                  child: Center(
                    child: Text(
                      alphaLists[index].toUpperCase(),
                      style: GoogleFont.homeHeadStyle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox inpiutWidget({
    required String label,
    required TextEditingController controller,
    required Function(String)? onChange,
  }) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        onChanged: onChange,
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kBlack),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kBlack),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: kBlack),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: Text(
              label,
              style: GoogleFont.textFieldStyle,
            )),
      ),
    );
  }
}
