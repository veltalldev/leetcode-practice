import 'dart:math';

import 'package:collection/collection.dart';

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
    n + 1,
    (_) => List.filled(budget + 1, 10.0),
  ); // high default cost

  // initialize the cost-weight matrix:
  // given a budget of 0, none of the entries can be rounded up
  // the smallest differences are just the default values
  for (var i = 0; i < n; i++) {
    dp[i][0] = 10.0;
  }
  // if none of the numbers are considered, no matter what the budget is
  // nothing can be rounded, the smallest D is the default
  for (var j = 1; j <= budget; j++) {
    dp[0][j] = 10.0;
  }

  final roundQueue = PriorityQueue<int>();

  print("looping i from 1 to <$n");
  for (var i = 1; i <= n; i++) {
    final arrayIndex = i - 1;
    print("\tlooping j from 1 to <=$budget");
    for (var j = 1; j <= budget; j++) {
      final pairwiseDifferenceSum = findPWDifferenceSum(Y, X, arrayIndex);
      final maintain = dp[i - 1][j];
      final ceil = pairwiseDifferenceSum;
      print("\t\ti = $i; j = $j");
      print("\t\tdp = $dp");
      print("\t\tdp[$i][$j] = ${dp[i][j]}");
      print("\t\tmaintain value = dp[$i - 1][$j] = $maintain");
      print("\t\trounding value = $ceil");
      if (maintain > ceil) {
        dp[i][j] = ceil;
        if (roundQueue.length >= budget) {
          roundQueue.removeFirst();
        }
        roundQueue.add(arrayIndex); // mark index as having been rounded up
        print("\t\trounding up index $arrayIndex, value ${X[arrayIndex]}");
        print("\t\troundSet = $roundQueue");
      } else {
        dp[i][j] = maintain;
        roundQueue.removeFirst();
        print("\t\tmaintaining index $arrayIndex, value ${X[arrayIndex]}");
        print("\t\troundSet = $roundQueue");
      }
    }
  }

  print("final dp = $dp");

  // roundSet "should" contain all the indices that need to be rounded up
  // to achieve the optimal result
  // ????? not really sure ????
  roundQueue.toList().forEach((index) {
    Y[index] = Y[index] + 1; // actually round the array
  });
  return Y;
}

double findPWDifferenceSum(List<int> Y, List<double> X, int ceilIndex) {
  print("DEBUG: X = $X");
  print("       Y = $Y");
  print("incrementing index = $ceilIndex");
  final errors = List.generate(
      Y.length, (i) => ((X[i] - Y[i]).abs() * 100).round() / 100.0);
  final delta = (X[ceilIndex].ceil() - X[ceilIndex]).abs();
  errors[ceilIndex] = ((delta) * 100).round() / 100.0;
  print("error array = $errors");
  var sum = errors.reduce((a, b) => a + b);
  return (sum * 100).round() / 100.0;
}

bool areBasicallyEqual(a, b) {
  final epsilon = 1e9;
  return (a - b).abs() < epsilon;
}

bool isSufficientlyLessThan(a, b) {
  final epsilon = 1e9;
  return a - b < -epsilon;
}

bool isSufficientlyGreaterThan(a, b) {
  final epsilon = 1e9;
  return a - b > epsilon;
}
