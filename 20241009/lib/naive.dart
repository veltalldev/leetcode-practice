/// 20241009
///
/// First observation, if the two subset sums are equal to each other, then
/// sum S1 and sum S2 must be equal to sum(nums) / 2
/// So the problem simplifies to finding a subset that sums to a certain value.
///
/// Each individual decision point is simple: we either take the number or
/// we don't, but its implication is far-reaching: every choice to include or
/// exclude a number leads to potentially wildly different sums. This
/// inter-mingling effect of choices indicates that the problem requires
/// a dynamic programming approach to optimize the search.
///
/// In fact, this is just a variant of the knapsack problem.

bool equalPartitionSums(List<int> nums) {
  if (nums.length < 2) {
    return false;
  }
  final sum = nums.reduce((a, b) => a + b);
  if (sum % 2 != 0) {
    return false;
  }
  final targetSum = sum ~/ 2;

  final dp =
      List.generate(nums.length + 1, (_) => List.filled(targetSum + 1, false));
  // initialization: can make sum 0 with 0 numbers
  dp[0][0] = true;

  for (var i = 1; i <= nums.length; i++) {
    for (var j = 0; j <= targetSum; j++) {
      if (j < nums[i - 1]) {
        // if sum is smaller than value being considered, cannot choose number
        // can only inherit the sum if it already happened
        dp[i][j] = dp[i - 1][j];
      } else {
        // choose to take the number || not take the number
        dp[i][j] = dp[i - 1][j - nums[i - 1]] || dp[i - 1][j];
      }
    }
  }

  return dp[nums.length][targetSum];
}
