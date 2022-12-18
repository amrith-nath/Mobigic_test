import 'package:flutter/material.dart';
import 'package:mobigic_test/views/core/colors/colors.dart';

class Vertex {
  int id;
  String value;
  Color color = kDarkGreen;

  Vertex({
    required this.value,
    required this.id,
  });
}
