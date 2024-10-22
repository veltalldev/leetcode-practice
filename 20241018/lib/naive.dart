import 'dart:mirrors';

/// 20241018

List<int> spiralOrder(List<List<int>> matrix) {
  final clockwise = true;
  final List<int> spiralList = [];
  final List<List<int>> source = List.from(matrix);
  spiralList.addAll(getSpiralEdge(matrix, MatrixEdge.TOP, clockwise));
  spiralList.addAll(getSpiralEdge(matrix, MatrixEdge.RIGHT, clockwise));
  spiralList.addAll(getSpiralEdge(matrix, MatrixEdge.BOTTOM, clockwise));
  spiralList.addAll(getSpiralEdge(matrix, MatrixEdge.LEFT, clockwise));
  matrix.where((row) {
    if(source.contains(element)

  });
}

enum MatrixEdge {
  TOP,
  RIGHT,
  BOTTOM,
  LEFT,
}

List<int> getSpiralEdge(
    List<List<int>> matrix, MatrixEdge edgeType, bool clockwise) {
  List<int> edge = [];
  switch (edgeType) {
    case MatrixEdge.TOP:
      final topEdge = clockwise ? matrix[0] : matrix[0].reversed;
      edge.addAll(topEdge); // top row
      break;
    case MatrixEdge.RIGHT:
      final rightEdge = clockwise
          ? matrix.map((row) => row.last)
          : matrix.reversed.map((row) => row.last);
      edge.addAll(rightEdge);
      break;
    case MatrixEdge.LEFT:
      final leftEdge = clockwise
          ? matrix.reversed.map((row) => row.first)
          : matrix.map((row) => row.first);
      edge.addAll(leftEdge);
      break;
    case MatrixEdge.BOTTOM:
      final bottomEdge = clockwise
          ? matrix[matrix.length - 1].reversed
          : matrix[matrix.length];
      edge.addAll(bottomEdge);
      break;
    default:
      throw Exception("Invalid matrix edge");
  }
  return edge;
}
