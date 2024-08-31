import 'dart:math';

/// this problem is tricky but one brute force solution is readily available:
/// simply explore all possible combinations of houses and colors.
/// This solution has a complexity of O(k^n) which is absurd, but it
/// definitely provides an accurate answer with relatively low effort.

// given an NxK matrix where each cell represents the cost of a
// particular house-color configuration
// List<List<double>> costs

// determine the minimum cost to build all N houses
// returnn double cost;

import 'package:test/test.dart';

void main() {
  group('findMinCost', () {
    test('Test with a simple 2x2 matrix', () {
      final costs = [
        [1.0, 2.0],
        [3.0, 4.0]
      ];
      expect(findMinCost(costs), equals(5.0));
    });

    test('Test with a 3x3 matrix', () {
      final costs = [
        [1.0, 5.0, 3.0],
        [2.0, 9.0, 4.0],
        [1.0, 5.0, 3.0]
      ];
      expect(findMinCost(costs), equals(6.0));
    });

    test('Test with a 3x3 matrix with non-trivial adjacent constraints', () {
      final costs = [
        [1.0, 100.0, 3.0],
        [2.0, 9.0, 4.0],
        [1.0, 100.0, 3.0]
      ];
      expect(findMinCost(costs), equals(6.0));
    });

    test('Test with a 4x3 matrix', () {
      final costs = [
        [1.0, 2.0, 3.0],
        [4.0, 5.0, 6.0],
        [7.0, 8.0, 9.0],
        [1.0, 2.0, 3.0]
      ];
      expect(findMinCost(costs), equals(15.0));
    });

    test('Test with no houses', () {
      final costs = <List<double>>[];
      expect(findMinCost(costs), equals(0.0));
    });

    test('Test with one house and multiple colors', () {
      final costs = [
        [10.0, 15.0, 20.0]
      ];
      expect(findMinCost(costs), equals(10.0));
    });
  });
}

// ======================================================

double findMinCost(List<List<double>> costs) {
  int n = costs.length;
  if (n == 0) return 0;
  int k = costs[0].length;

  // good old minimum value tracker
  var minCost = double.infinity;

  // generate the config space: k^n x n
  final configSpace = List.generate(pow(k, n).toInt(), (configIndex) {
    final oneConfig = List.generate(n, (i) {
      // one particular configuration of house x color combination
      // e.g. [red, blue, green, red, yellow, red]
      // each "decimal place" (i) indicates the color choice for the house
      // in that index, with the color being represented as an integer
      // from 0 to k-1 (corresponding with the columns 0 to k-1 in the
      // cost matrix)
      final decimalPlace = (n - 1) - i;
      final layerSize = pow(k, decimalPlace);
      return (configIndex ~/ layerSize) % k;
    });
    return oneConfig;
  });

  configSpace.forEach((oneConfig) {
    if (hasNoAdjacentDuplicates(oneConfig)) {
      var costSum = 0.0;
      for (var i = 0; i < n; i++) {
        final houseChoice = i;
        final colorChoice = oneConfig[i];
        costSum += costs[houseChoice][colorChoice];
      }
      minCost = minCost < costSum ? minCost : costSum;
    }
  });

  return minCost;
}

bool hasNoAdjacentDuplicates(List<int> houseColorConfig) {
  for (var i = 1; i < houseColorConfig.length; i++) {
    if (houseColorConfig[i] == houseColorConfig[i - 1]) {
      return false;
    }
  }
  return true;
}
