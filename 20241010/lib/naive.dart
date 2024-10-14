/// 20241010
///
/// This problem is difficult and requires a rather creative perspective
///   1.  Unlike other DP problems, considering a partial config of the input
///       does not lead to a valid partial solution (that can be built upon
///       to reach the final solution) because a valid config must include
///       ALL numbers
///   2.  The existence of negative values make it impossible to enumerate
///       partial sum values from 0 to targetSum, but even if we could, we run
///       into problem #1 anyway.
///
///   If we transform the problem, we can turn it into a partial sum problem
///   let S be the max sum of the array (all positive signs). Assume there
///   exists a bifurcation of the set into two subsets (P and M) whose sums
///   add to the target number `k` as the problem requirement formulates,
///   -   `P + M = k`
///   -   `P - M = S`
///   ->  `P = (S+k)/2`
///
///   This means that if such a bifurcation was possible, we can find the
///   positive half (the numbers that need to receive positive signs)
///   by searching for number values that add up to P = (S+k)/2
///
///   This simplifies the problem to a `partial sum to k` problem where
///   we need to count the number of ways we can subsum a list of values
///   to a target number `k`. Counting configs is typically a 1D DP problem

int targetSum(List<int> nums, int k) {
  if (nums.length == 0) return 0;
  var targetSum = nums.reduce((a, b) => a + b) + k;
  if (targetSum % 2 != 0) return 0;
  targetSum ~/= 2;

  /// problem becomes find partial sums in `nums` that equal `k`
  /// So, we track the partial sums and the number of ways to produce it
  /// dp[j] = number of ways to produce sum j
  final dp = List.filled(targetSum + 1, 0);
  dp[0] = 1; // one way to produce sum of 0: choose nothing
  for (var i in nums) {
    for (var j = targetSum; j >= 1; j--) {
      if (j >= i) {
        dp[j] += dp[j - i];
      }
    }
  }

  return dp[targetSum];
}
