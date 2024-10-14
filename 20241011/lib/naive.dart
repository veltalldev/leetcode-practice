import 'dart:math';

/// 20241011
///
/// Revisiting the House Painting problem after some
/// time to solidify understanding

int minCostToPaintHouses(List<List<int>> costs) {
  if (costs.isEmpty) return 0;
  final n = costs.length;
  final k = costs[0].length;

  final dp = List.generate(n, (_) => List.filled(k, 0));
  // initialize dp[0][j] to the costs for that first house
  for (var j = 0; j < k; j++) {
    dp[0][j] = costs[0][j];
  }

  for (var i = 1; i < n; i++) {
    // for each new house considered, find the previous results
    final (min1, min2) = findMins(dp, i - 1);

    // can now update dp[i][j] now that we know about dp[i-1]
    for (var j = 0; j < k; j++) {
      if (dp[i - 1][j] == min1) {
        dp[i][j] = costs[i][j] + min2;
      } else {
        dp[i][j] = costs[i][j] + min1;
      }
    }
  }

  final (min1, _) = findMins(dp, n - 1);
  return min1;
}

(int, int) findMins(List<List<int>> dp, int index) {
  var min1 = 1e9.toInt();
  var min2 = 1e9.toInt();

  for (var number in dp[index]) {
    if (min1 > number) {
      min2 = min1; // update min2 before losing reference to min1
      min1 = number;
    } else if (min2 > number) {
      min2 = number;
    }
  }

  return (min1, min2);
}
