/// this is a classic combinatorics problem.
/// Observe that there are a total of M-1 moves across and N-1 moves downward
/// for a total of M + N - 2 moves. That is to say, we need to arrange
/// N-1 moves among a total of M + N - 2. A simple nCr problem.
///
/// Programmatically. we observe that each cell can only be access by the cell
/// above it and the cell to its left. That is to say: the number of paths
/// leading to cell i,j is the sum of the paths leading to the 2 cells adjacent
/// to it.

import 'package:test/test.dart';

List<List<int>> generateMatrix(int n, int m) {
  return List.generate(n, (_) => List.filled(m, 0));
}

int countPaths(List<List<int>> matrix) {
  int n = matrix.length;
  int m = matrix.isNotEmpty ? matrix[0].length : 0;

  if (n == 0 || m == 0) return 0;

  // there is exactly 1 way to reach each of the cells on the left column 0
  for (var i = 0; i < n; i++) {
    matrix[i][0] = 1;
  }
  // and exactly one way to reach each of the cells on the top row 0
  for (var j = 0; j < m; j++) {
    matrix[0][j] = 1;
  }

  // double loop and fill in each cell iteratively with info from its
  // neighbors
  for (var i = 1; i < n; i++) {
    for (var j = 1; j < m; j++) {
      matrix[i][j] = matrix[i - 1][j] + matrix[i][j - 1];
    }
  }
  return matrix[n - 1][m - 1];
}

// ================================================================

void main() {
  group('generateMatrix', () {
    test('should create a matrix of the correct size', () {
      final matrix = generateMatrix(3, 4);
      expect(matrix.length, 3); // Number of rows
      expect(matrix[0].length, 4); // Number of columns
    });

    test('should initialize all elements to 0', () {
      final matrix = generateMatrix(3, 4);
      for (var row in matrix) {
        for (var value in row) {
          expect(value, 0);
        }
      }
    });

    test('should return an empty list for zero rows or columns', () {
      final matrix1 = generateMatrix(0, 4);
      final matrix2 = generateMatrix(3, 0);
      expect(matrix1, []);
      expect(matrix2,
          isNotEmpty); // Since columns are empty, each row will be an empty list
      expect(matrix2[0], []);
    });
  });

  group('countPaths', () {
    test('should return 1 for a 1x1 matrix', () {
      final matrix = generateMatrix(1, 1);
      final result = countPaths(matrix);
      expect(result, 1);
    });

    test('should return the correct number of paths for a 2x2 matrix', () {
      final matrix = generateMatrix(2, 2);
      final result = countPaths(matrix);
      expect(result, 2);
    });

    test('should return the correct number of paths for a 3x3 matrix', () {
      final matrix = generateMatrix(3, 3);
      final result = countPaths(matrix);
      expect(result, 6);
    });

    test('should return the correct number of paths for a 5x5 matrix', () {
      final matrix = generateMatrix(5, 5);
      final result = countPaths(matrix);
      expect(result, 70);
    });

    test('should return 0 for an empty matrix', () {
      final matrix = generateMatrix(0, 0);
      final result = countPaths(matrix);
      expect(result, 0);
    });
  });
}
