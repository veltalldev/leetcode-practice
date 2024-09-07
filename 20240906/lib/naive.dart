import 'dart:math';

/// First, observe that a "wider" subarray tends to yield a bigger sum.
/// The only two occasion where we need to trim either side of the
/// current subarray is:
/// - when the current value nums[i] or nums[j] is a negative number
/// - when a rolling sum from i to i+k yields a negative value.
/// which effectively can be encompassed by the rolling sum condition

int findLargestContiguousSum(List<int> nums) {
  int maxSum = 0;
  int runningSumLeft = 0;
  int runningSumRight = 0;
  // start with the "widest" subarray
  int i = 0;
  int j = nums.length - 1;
  if (nums.length == 0) {
    return maxSum;
  }
  while (i <= nums.length - 1 && j >= 0) {
    if (nums[i] <= nums[j]) {
      runningSumLeft += nums[i++]; // record the value then move on
    } else if (nums[i] >= nums[j]) {
      runningSumRight += nums[j--];
    }
    if (runningSumLeft < 0) {
      runningSumLeft = 0;
      continue;
    }
    if (runningSumRight < 0) {
      runningSumRight = 0;
      continue;
    }
    maxSum = max(
      maxSum,
      max(
        runningSumLeft,
        runningSumRight,
      ),
    );
  }

  return maxSum;
}
