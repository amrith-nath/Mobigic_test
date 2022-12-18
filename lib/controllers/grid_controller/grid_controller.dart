import 'dart:developer';

import 'package:get/get.dart';
import 'package:mobigic_test/models/vertex.dart';

class GridController extends GetxController {
  RxString stringList = ''.obs;

  List<List<Vertex?>> vertices = [];

  List<Vertex> vertexIds = [];
  Set<int> vertexIdsFnl = {};
  int row = 0;
  int column = 0;
  List<List<Vertex?>> createVertices(List<String> list, int row, int column) {
    row = row;
    column = column;
    int count = -1;
    vertices = List.generate(
      column,
      (index) => List.generate(row, (i) {
        count += 1;
        return Vertex(value: list[count], id: count);
      }),
    );

    return vertices;
  }

  bool right = false;
  bool left = false;
  bool up = false;
  bool down = false;
  bool digonal = false;

  bool getIds() {
    if (stringList.value.isEmpty) {
      digonal = right = left = up = down = false;
      vertexIdsFnl = {};
      return false;
    } else if (stringList.value.length == 1) {
      digonal = right = left = up = down = true;
    }

    bool helperFn(
      List<List<Vertex?>> vertexList,
      int i,
      int j,
      int count,
      String word,
    ) {
      if (count == stringList.value.length) {
        return true;
      }

      if (i < 0 ||
          i >= vertexList.length ||
          j < 0 ||
          j >= vertexList[i].length ||
          vertexList[i][j]?.value != word[count]) {
        vertexIdsFnl = {};

        return false;
      }

      Vertex? temp = vertexList[i][j];
      vertexList[i][j] = null;

      log('Iam working (down - $down) (left $left) (right $right) (up  $up)');

      bool found = false;
      if (helperFn(vertexList, 0, 0, count + 1, word)) {
        log('Iam working 1 ');
        found = true;
      } else if (helperFn(vertexList, i - 1, j, count + 1, word) && up) {
        found = true;
        digonal = left = right = false;
        log('Iam working 2');
      } else if (helperFn(vertexList, i, j + 1, count + 1, word) && right) {
        found = true;
        digonal = up = down = false;
        log('Iam working 3');
      } else if (helperFn(vertexList, i, j - 1, count + 1, word) && left) {
        found = true;
        digonal = up = down = false;

        log('Iam working 4');
      } else if (helperFn(vertexList, i + 1, j, count + 1, word) && down) {
        found = true;
        left = right = false;

        log('Iam working 5');
      } else if (helperFn(vertexList, i + 1, j - 1, count + 1, word) &&
          digonal) {
        found = true;
        left = right = up = down = false;
        log('Iam working 6');
      }

      vertexList[i][j] = temp;
      if (found) {
        vertexIdsFnl.add(vertexList[i][j]!.id);
      } else {
        vertexIdsFnl = {};
      }
      return found;
    }

    for (var i = 0; i < vertices.length; i++) {
      for (var j = 0; j < vertices[i].length; j++) {
        if (vertices[i][j]?.value == stringList.value[0] &&
            helperFn(vertices, i, j, 0, stringList.value)) {
          if (stringList.value.length == 1) {
            vertexIdsFnl = {vertices[i][j]!.id};
          }
          return true;
        }
      }
    }
    vertexIdsFnl = {};
    return false;
  }
}
