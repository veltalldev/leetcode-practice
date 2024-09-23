import 'dart:math';

/// 20240921
/// See file problem_outline.md for details on train of thought

List<int> minimumDifferenceRounding(List<double> X) {
  final Y = X.map((num) => num.floor().toInt()).toList();
  final budget = X.reduce((a, b) => a + b) - Y.reduce((a, b) => a + b);
  return knapsackRound(X, Y, budget.toInt());
}

// this is a specialized version of the knacpsack problem:
// - each "item" is a decision whether to round y_i UP or not
// - the goal is to minimize sum(|y_i - x_i|)
// - the cost is 1 for each decision point
// - capacity is budget
List<int> knapsackRound(List<double> X, List<int> Y, int budget) {
  final n = Y.length;
  // define the cost-weight matrix
  final dp = List.generate(
    n,
    (_) => List.filled(budget, budget.toDouble()),
  ); // high default cost

  // initialize the cost-weight matrix:
  // given a budget of 0, none of the entries can be rounded up
  for (var i = 0; i < n; i++) {
    dp[i][0] = (X[i] - Y[i]).abs();
  }

  final roundSet = <int>{};

  for (var i = 0; i < n; i++) {
    for (var j = 1; j < budget; j++) {
      final pairwiseDifference = Y[i] + 1 - X[i];
      final maintain = dp[i - 1][j];
      final ceil = pairwiseDifference + dp[i - 1][j - 1];
      if (maintain < ceil) {
        dp[i][j] = ceil;
        roundSet.add(i); // mark index i as having been rounded up
      } else {
        dp[i][j] = maintain;
        roundSet.remove(i);
      }
    }
  }

  // roundSet "should" contain all the indices that need to be rounded up
  // to achieve the optimal result
  // ????? not really sure ????
  roundSet.forEach((index) {
    Y[index] = Y[index] + 1; // actually round the array
  });
  return Y;
}
