/// this is an attempt at an original solution to the LIS problem
/// This solution utilizes a 2D array to keep track of the following state
/// dp[i][j] := the length of the subsequence that PREVIOUSLY ended at j
/// and we're now considering the continuation with the item at i

import 'package:test/test.dart';

void main() {
  group('Longest Increasing Subsequence', () {
    test('LIS of an empty list should be 0', () {
      expect(longestIncreasingSequence([]), equals(0));
    });

    test('LIS of a single element list should be 1', () {
      expect(longestIncreasingSequence([5]), equals(1));
    });

    test('LIS of a strictly increasing sequence', () {
      expect(longestIncreasingSequence([1, 2, 3, 4, 5]), equals(5));
    });

    test('LIS of a strictly decreasing sequence', () {
      expect(longestIncreasingSequence([5, 4, 3, 2, 1]), equals(1));
    });

    test('LIS of a random sequence with no repeated elements', () {
      expect(longestIncreasingSequence([10, 9, 2, 5, 3, 7, 101, 18]),
          equals(4)); // LIS is [2, 3, 7, 101]
    });

    test('LIS of a sequence with repeated elements', () {
      expect(longestIncreasingSequence([0, 1, 0, 3, 2, 3]),
          equals(4)); // LIS is [0, 1, 2, 3]
    });

    test('LIS of a sequence where all elements are the same', () {
      expect(longestIncreasingSequence([7, 7, 7, 7, 7]),
          equals(1)); // Any single element is the LIS
    });

    test('LIS of a mixed sequence with increasing and decreasing patterns', () {
      expect(longestIncreasingSequence([3, 10, 2, 1, 20]),
          equals(3)); // LIS is [3, 10, 20]
    });

    test('LIS of a sequence with negative numbers', () {
      expect(longestIncreasingSequence([-5, -1, 0, -2, 3, 2, 4]),
          equals(5)); // LIS is [-5, -1, 0, 3, 4]
    });

    test('LIS with both positive and negative numbers', () {
      expect(longestIncreasingSequence([-2, 0, 1, -3, 4, -1, 2]),
          equals(4)); // LIS is [-2, 0, 1, 4]
    });
  });
}

// ============================================================
// ============================================================
// ============================================================

int longestIncreasingSequence(List<int> seq) {
  final n = seq.length;
  final dp = List.generate(n, (_) => List.filled(n, 0));

  // initialize
  if (n == 0) return 0;
  if (n == 1) return 1;
  // the first value by itself is a subsequence length 1
  dp[0][0] = 1;
  // every value after that, if following the first value,
  // either increases the length by 1 or 0
  for (var i = 1; i < n; i++) {
    dp[i][0] = dp[0][0] + (seq[i] > seq[i - 1] ? 1 : 0);
  }

  // for every value that follows every possible other end value,
  // the length increases by 1 or 0
  for (var i = 1; i < n; i++) {
    for (var j = 1; j < i; j++) {
      print("Currently checking values ${seq[i]} & ${seq[j]}");
      final inc = (seq[i] > seq[j] ? 1 : 0);
      if (inc == 1) {
        print("${seq[i]} > ${seq[j]}: dp[$i][$j] = ${dp[j][j - 1]} + $inc");
      } else {
        print("${seq[i]} < ${seq[j]}: dp[$i][$j] = ${dp[j][j - 1]} + $inc");
      }
      dp[i][j] = dp[j][j - 1] + inc;
      print(dp[i][j]);
      // dp.forEach((row) {
      //   print(row);
      // });
    }
  }

  return dp[n - 1][n - 2];
}
