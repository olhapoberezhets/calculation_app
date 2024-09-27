import 'dart:collection';

import 'package:calculation_app/models/coordinates_mode/coordinates_model.dart';

class PathCalculation {
  final List<String> field;
  final CoordinatesModel start;
  final CoordinatesModel end;
  final int n;

  PathCalculation(this.field, this.start, this.end) : n = field.length;

  final List<List<int>> directions = [
    [-1, 0],
    [1, 0],
    [0, -1],
    [0, 1],
    [-1, -1],
    [-1, 1],
    [1, -1],
    [1, 1],
  ];

  bool isValid(int x, int y) {
    return x >= 0 && y >= 0 && x < n && y < n && field[x][y] == '.';
  }

  List<CoordinatesModel>? bfs() {
    Queue<CoordinatesModel> queue = Queue();
    Map<CoordinatesModel, CoordinatesModel?> parents = {};
    Set<CoordinatesModel> visited = {};

    queue.add(start);
    visited.add(start);
    parents[start] = null;

    while (queue.isNotEmpty) {
      CoordinatesModel current = queue.removeFirst();

      if (current.x == end.x && current.y == end.y) {
        return reconstructPath(parents);
      }

      for (var dir in directions) {
        int nx = current.x + dir[0];
        int ny = current.y + dir[1];

        if (isValid(nx, ny)) {
          CoordinatesModel next = CoordinatesModel(x: nx, y: ny);
          if (!visited.contains(next)) {
            queue.add(next);
            visited.add(next);
            parents[next] = current;
          }
        }
      }
    }

    return null;
  }

  List<CoordinatesModel>? reconstructPath(
      Map<CoordinatesModel, CoordinatesModel?> parents) {
    List<CoordinatesModel> path = [];
    CoordinatesModel? step = end;
    while (step != null) {
      path.add(step);
      step = parents[step];
    }
    return path.reversed.toList();
  }
}
