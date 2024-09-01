import 'dart:math';

/// this is actually not the naive brute force solution in O(2^n) time
/// Rather, I'm implementing the dynamic programming solution for it
/// as practice.

import 'package:test/test.dart';

void main() {
  group('Knapsack Dynamic Programming Solution Tests', () {
    test('Test Case 1: Basic test with small inputs', () {
      final weights = [1, 2, 3];
      final values = [10, 20, 30];
      final capacity = 5;
      expect(knapsack(weights, values, capacity), equals(50));
    });

    test('Test Case 2: No items', () {
      final weights = <int>[];
      final values = <int>[];
      final capacity = 10;
      expect(knapsack(weights, values, capacity), equals(0));
    });

    test('Test Case 3: Zero capacity', () {
      final weights = [1, 2, 3];
      final values = [10, 20, 30];
      final capacity = 0;
      expect(knapsack(weights, values, capacity), equals(0));
    });

    test('Test Case 4: Capacity exactly matches one item', () {
      final weights = [2, 3, 5];
      final values = [20, 30, 50];
      final capacity = 5;
      expect(knapsack(weights, values, capacity), equals(50));
    });

    test('Test Case 5: Capacity requires choosing the optimal subset', () {
      final weights = [2, 3, 4, 5];
      final values = [3, 4, 5, 6];
      final capacity = 5;
      expect(knapsack(weights, values, capacity),
          equals(7)); // Choose items with weights 2 and 3
    });

    test('Test Case 6: Larger inputs', () {
      final weights = [3, 4, 7, 8, 9];
      final values = [4, 5, 10, 11, 13];
      final capacity = 16;
      expect(knapsack(weights, values, capacity), equals(23));
    });

    test('Test Case 7: Single item too heavy', () {
      final weights = [5];
      final values = [10];
      final capacity = 3;
      expect(knapsack(weights, values, capacity), equals(0));
    });

    test('Test Case 8: All items fit into the knapsack', () {
      final weights = [1, 2, 3];
      final values = [10, 20, 30];
      final capacity = 10;
      expect(knapsack(weights, values, capacity), equals(60)); // All items fit
    });
  });
}

// =============================================================
// =============================================================
// =============================================================

// given:
// - List<int> values
// - List<int> weights
// - N = values.length
// - W: capacity constant

// return int maxKnapsackValue

int knapsack(List<int> weights, List<int> values, int capacity) {
  final n = weights.length;

  // first we define the state table, wherein each cell represents the max
  // possible value that can be put into the knapsack IF:
  // - we only consider the first i items, AND
  // - the knapsack only has j remaining capacity
  final dp = List.generate(
    n + 1,
    (_) => List.generate(capacity + 1, (_) => 0),
  );

  // we make the observation that
  // - given a knapsack of capacity 0, nothing can be added, maxValue = 0
  // - given 0 items to add to the knapsack, nothing can be added, maxValue = 0
  dp[0].fillRange(0, capacity + 1, 0);
  dp.forEach((row) {
    row[0] = 0;
  });

  // Then we examine each item individually. The consideration for each
  // item is simple: we either include it in the bag, or we don't.
  // the trick is that we also consider this item in the context of
  // EVERY possible remaining capacity for the bag
  for (var i = 1; i < n + 1; i++) {
    for (var j = 1; j < capacity + 1; j++) {
      // if we don't add item i, the max value achievable is
      // simply the max value BEFORE we considered that item
      final excludeValue = dp[i - 1][j];
      // if we choose to add item i into the bag, then the
      // value increases by values[i] compared to the previous step
      // but the capacity decreases by weights[i]
      var includeValue = 0;
      if (weights[i - 1] <= j) {
        includeValue = values[i - 1] + dp[i - 1][j - weights[i - 1]];
      }

      // between these two options, we simply choose the bigger one
      dp[i][j] = max(excludeValue, includeValue);
    }
  }

  // once the loops are done, the table is filled, and the optimal
  // value is located at index (n, capacity) i.e. the last cell of the table
  return dp[n][capacity];
}
