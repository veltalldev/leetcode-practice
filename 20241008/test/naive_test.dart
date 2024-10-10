import 'package:test/test.dart';
import 'package:leetcode20241008/naive.dart';

void main() {
  group('findShortestRunnerRoute Tests', () {
    test('Test Case 0: simple short single path', () {
      final elevations = {0: 5, 1: 10, 2: 7};
      final pathDistances = {
        (0, 1): 10,
        (1, 2): 2,
        (2, 0): 4,
      };

      expect(findShortestRunnerRoute(elevations, pathDistances), equals(16));
    });
    test('Test Case 1: Simple uphill then downhill route', () {
      final elevations = {0: 5, 1: 25, 2: 15, 3: 20, 4: 10};
      final pathDistances = {
        (0, 1): 10,
        (0, 2): 8,
        (0, 3): 15,
        (1, 3): 12,
        (2, 4): 10,
        (3, 4): 5,
        (3, 0): 17,
        (4, 0): 10
      };

      expect(findShortestRunnerRoute(elevations, pathDistances), equals(28));
    });

    test('Test Case 2: No valid route to home', () {
      final elevations = {0: 5, 1: 25, 2: 15, 3: 20};
      final pathDistances = {(0, 1): 10, (0, 2): 8, (1, 3): 12, (2, 3): 10};

      expect(findShortestRunnerRoute(elevations, pathDistances),
          equals(1e9.toInt())); // No valid downhill path
    });

    test('Test Case 3: Uphill and downhill combination with multiple routes',
        () {
      final elevations = {0: 5, 1: 25, 2: 30, 3: 20, 4: 10};
      final pathDistances = {
        (0, 1): 10,
        (0, 2): 15,
        (1, 3): 5,
        (2, 4): 10,
        (3, 0): 5,
        (4, 0): 10
      };

      expect(findShortestRunnerRoute(elevations, pathDistances), equals(20));
    });

    test('Test Case 4: Circular path with one long route', () {
      final elevations = {0: 5, 1: 20, 2: 30, 3: 15};
      final pathDistances = {(0, 1): 7, (1, 2): 5, (2, 3): 12, (3, 0): 10};

      expect(findShortestRunnerRoute(elevations, pathDistances), equals(34));
    });

    test(
        'Test Case 5: Shortest route involves several uphill and downhill transitions',
        () {
      final elevations = {0: 5, 1: 10, 2: 15, 3: 20, 4: 25, 5: 10};
      final pathDistances = {
        (0, 1): 5,
        (1, 2): 5,
        (2, 3): 5,
        (3, 4): 5,
        (4, 5): 5,
        (5, 0): 5
      };

      expect(findShortestRunnerRoute(elevations, pathDistances), equals(30));
    });

    test('Test Case 6: Large graph with many possible paths', () {
      final elevations = {
        0: 5,
        1: 10,
        2: 20,
        3: 15,
        4: 10,
        5: 30,
        6: 25,
        7: 15
      };
      final pathDistances = {
        (0, 1): 4,
        (0, 2): 8,
        (1, 3): 3,
        (1, 4): 7,
        (2, 5): 10,
        (3, 6): 12,
        (4, 7): 5,
        (6, 0): 10,
        (7, 0): 8
      };

      expect(findShortestRunnerRoute(elevations, pathDistances), equals(24));
    });
  });
}
