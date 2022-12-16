import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobigic_test/views/grids/screen_grid.dart';

import '../../core/colors/colors.dart';
import '../../core/constants/constants.dart';
import '../../core/fonts/fonts.dart';

class InputCardWidget extends StatelessWidget {
  InputCardWidget({super.key});

  final TextEditingController rowController = TextEditingController();
  final TextEditingController columnController = TextEditingController();
  final TextEditingController alphabetController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              kHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  inpiutWidget(
                    label: 'Rows',
                    controller: rowController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number';
                      } else if (value.contains(' ')) {
                        return 'Please avoid spaces ' '';
                      }
                      return null;
                    },
                  ),
                  kwidth,
                  inpiutWidget(
                    label: 'Columns',
                    controller: columnController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a number';
                      } else if (value.contains(' ')) {
                        return 'Please avoid spaces ' '';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              kHeight,
              inpiutWidget(
                label: 'Alphabets',
                isNumber: false,
                controller: alphabetController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  } else if (!rowController.text.contains(' ') &&
                      !columnController.text.contains(' ')) {
                    var a = int.parse(rowController.text.trim());
                    var b = int.parse(columnController.text.trim());
                    if (value.length < a * b) {
                      return 'Need ${a * b} alphabets its only ${value.length}';
                    } else if (value.length > a * b) {
                      return 'Only ${a * b} alphabets needed now its ${value.length}';
                    }

                    return null;
                  } else if (value.contains(' ')) {
                    return 'Please avoid spaces ' '';
                  }
                  return null;
                },
              ),
              kHeight,
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: kBlack),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Get.to(
                      () => const Screengrid(),
                      transition: Transition.downToUp,
                      duration: const Duration(milliseconds: 400),
                    );
                  }
                },
                icon: const Icon(Icons.grid_3x3_rounded),
                label: const Text('Make Grid'),
              ),
              kHeight,
            ],
          ),
        ),
      ),
    );
  }

  Flexible inpiutWidget({
    required String label,
    bool isNumber = true,
    required TextEditingController controller,
    required String? Function(String?)? validator,
  }) {
    return Flexible(
      child: SizedBox(
        height: 50,
        child: TextFormField(
          validator: validator,
          controller: controller,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
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
      ),
    );
  }
}
