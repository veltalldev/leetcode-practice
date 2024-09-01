/// this improved solution makes use of Dynamic Programming to consider
/// all possible choices for each house and how they affect the configurations
/// of the other houses
///
/// For each house, the main problem is to choose one color among k options
/// Each of these choices would then affect the rest of the houses (since
/// the adjacent houses cannot share that color)
///
/// We begin with considering just one house, then given the optimal solution
/// for that base case, we build onto considering 2 houses.
///
/// The core logic is: the minimum cost for a collection of the first
/// i houses (dp[i]) is equal to the sum of
/// 1. the cost of the color chosen for that house (costs[i][j])
/// 2. the minimum cost to paint the previous i-1 houses GIVEN THAT
///    we chose color j for house i
///
/// Since we don't know which color j would result in the smallest cost, we
/// explore all of them and for each option, we adjust the previous houses
/// to accomodate for the duplication stipulation.

import 'package:test/test.dart';

void main() {
  group('findMinCost DP Solution', () {
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

    test('Test with a large 3x4 matrix', () {
      final costs = [
        [10.0, 15.0, 12.0, 20.0],
        [30.0, 25.0, 23.0, 35.0],
        [5.0, 8.0, 7.0, 9.0]
      ];
      expect(findMinCost(costs), equals(38.0));
    });

    test('Test with increasing costs matrix', () {
      final costs = [
        [1.0, 2.0, 3.0],
        [4.0, 5.0, 6.0],
        [7.0, 8.0, 9.0]
      ];
      expect(findMinCost(costs), equals(13.0));
    });
  });
}

// ============================================================
// ============================================================
// ============================================================

double findMinCost(List<List<double>> costs) {
  int n = costs.length;
  if (n == 0) return 0;
  int k = costs[0].length;

  // the list of MINIMUM costs for CONSIDERING up to house i
  // if it is painted with color j
  var dp = List.generate(n, (_) => List.filled(k, 0.0));

  // initialize: if only the first house is considered, then the minimum
  // cost to paint that far is simply the cost of that house
  // painted with the respective color option j
  for (var j = 0; j < k; j++) {
    dp[0][j] = costs[0][j]; // minimal cost = sticker price
  }

  // for subsets including 2 or more houses, the minimum cost of each step
  // dp[i][j] is the smallest among the sums of
  // 1. house i with the color j (0 through k)
  // 2. the minimum cost of the previous step for ALL colors BUT j
  for (var i = 1; i < n; i++) {
    // Step 1: extract the minimums of the previous step
    // from existing data
    var min1 = double.infinity;
    var min2 = double.infinity;
    for (var j = 0; j < k; j++) {
      var prev = dp[i - 1][j];
      if (prev <= min1) {
        min2 = min1;
        min1 = prev;
      } else if (prev > min1 && prev < min2) {
        min2 = prev;
      }
    }

    // Step 2: use those minimum values to fill in the current
    // house configuration: loop through all possible color choices,
    // for each choice, find the minimum cost of the previous config,
    // this minimum cost is either min1 (the minimum) or min2 (the
    // second minimum in case min1 was calculated with color j
    // for house i-1, which is forbidden)
    for (var j = 0; j < k; j++) {
      var prev = dp[i - 1][j];
      if (prev == min1) {
        dp[i][j] = costs[i][j] + min2;
      } else {
        dp[i][j] = costs[i][j] + min1;
      }
    }
  } // finished considering all subsets of houses
  return dp[n - 1].reduce((a, b) => a < b ? a : b);
}
