import 'package:test/test.dart';
import 'package:leetcode20241011/naive.dart';

void main() {
  group('House Painting Tests', () {
    test('Test case 1: Standard case with multiple houses and colors', () {
      List<List<int>> costs = [
        [17, 2, 17],
        [16, 16, 5],
        [14, 3, 19]
      ];
      expect(minCostToPaintHouses(costs), equals(10));
    });

    test('Test case 2: Only one house to paint', () {
      List<List<int>> costs = [
        [7, 6, 2]
      ];
      expect(minCostToPaintHouses(costs), equals(2));
    });

    test('Test case 3: Multiple houses, two colors only', () {
      List<List<int>> costs = [
        [5, 8],
        [6, 9],
        [7, 10]
      ];
      expect(minCostToPaintHouses(costs), equals(21));
    });

    test('Test case 4: All houses have the same costs for each color', () {
      List<List<int>> costs = [
        [5, 5, 5],
        [5, 5, 5],
        [5, 5, 5]
      ];
      expect(minCostToPaintHouses(costs),
          equals(15)); // Any color combination results in the same total cost
    });

    test('Test case 5: Edge case with the maximum number of houses and colors',
        () {
      List<List<int>> costs = List.generate(
          100, (index) => List.generate(20, (index) => index + 1));
      expect(minCostToPaintHouses(costs),
          isNonNegative); // Large input with valid non-negative result
    });
  });
}
