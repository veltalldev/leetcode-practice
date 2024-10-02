import 'package:test/test.dart';
import '../lib/naive.dart';

void main() {
  group('Fewest Bricks Cut', () {
    test('Example case', () {
      // Arrange
      List<List<int>> wall = [
        [3, 5, 1, 1],
        [2, 3, 3, 2],
        [5, 5],
        [4, 4, 2],
        [1, 3, 3, 3],
        [1, 1, 6, 1, 1]
      ];

      // Act
      int result = fewestBricksCut(wall);

      // Assert
      expect(result, equals(2));
    });

    test('No cuts needed (all bricks aligned)', () {
      // Arrange
      List<List<int>> wall = [
        [1, 1, 1, 1],
        [1, 1, 1, 1],
        [1, 1, 1, 1]
      ];

      // Act
      int result = fewestBricksCut(wall);

      // Assert
      expect(result, equals(0));
    });

    test('Single row wall', () {
      // Arrange
      List<List<int>> wall = [
        [3, 2, 2]
      ];

      // Act
      int result = fewestBricksCut(wall);

      // Assert
      expect(result, equals(0)); // Single row, no cut needed
    });

    test('All bricks are the same width', () {
      // Arrange
      List<List<int>> wall = [
        [5, 5],
        [5, 5],
        [5, 5]
      ];

      // Act
      int result = fewestBricksCut(wall);

      // Assert
      expect(result, equals(0)); // The edges are all aligned, no cuts
    });

    test('Wall with varying rows and no alignment', () {
      // Arrange
      List<List<int>> wall = [
        [1, 2, 2],
        [2, 3],
        [4, 1],
        [3, 2]
      ];

      // Act
      int result = fewestBricksCut(wall);

      // Assert
      expect(result, equals(2)); // Minimum cut required
    });
  });
}
