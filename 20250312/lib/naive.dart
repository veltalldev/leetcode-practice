import 'dart:math';

/// 20250312
///
/// # Maximum Subarray

/// Given an integer array `nums`, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.
///
/// ## Examples
///
/// **Example 1:**
/// ```
/// Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
/// Output: 6
/// Explanation: [4,-1,2,1] has the largest sum = 6.
/// ```
///
/// **Example 2:**
/// ```
/// Input: nums = [1]
/// Output: 1
/// ```
///
/// **Example 3:**
/// ```
/// Input: nums = [5,4,-1,7,8]
/// Output: 23
/// ```
///
/// ## Constraints
/// - 1 <= nums.length <= 10^5
/// - -10^4 <= nums[i] <= 10^4
///
/// Start: 6:45pm
///
/// So my first thought is to use a sliding window, but quickly after that, I recognize that there is no clean "window maintenance condition" to observe in this context, so it's very unlikely to be the choice. Instead of a condition, we're rather interested in the aggregate behavior of every possible window, so pruning options greedily likely won't fly.
///
/// Upon a second look at the problem, I recognize that the goal is to avoid "highly" negative values or even areas, which makes my brain question: "What makes an area undesirable?"
///
/// The answer is if its cumulative contribution goes negative, that's the difference between wanting to avoid -1 and wanting to avoid -100. So we then consider a negative number and the decision of what to do with it:
///
/// Option 1: We ignore the negative value and keep the LEFT side (because everything behind the negative value does not make up for having to tolerate it)
///
/// Option 2: We ignore the negative value as well as all the work we've done so far. The negative value here is so negative that it undoes all the cumulative work, so we might as well start fresh
///
/// Option 3: Eating the negative value and continue accumulating values as normal. In this case, the negative value can be tolerated because the values that precede and follow it are large enough to be desirable.
///
/// All 3 of these options can be observed with a single rule: keep accumulating until rolling sum goes negative, at which point we abandon that result (as well as the current negative value) and start fresh. If we keep track of the maximum sum along the way at each point, we're guaranteed not to miss any potentially higher sum because we've already considered all 3 options with this strategy.
///
/// ===== Code ===

void main(List<String> args) {
  final nums1 = [-2, 1, -3, 4, -1, 2, 1, -5, 4];
  final ans1 = 6;
  final nums2 = [1];
  final ans2 = 1;
  final nums3 = [5, 4, -1, 7, 8];
  final ans3 = 23;
  test(nums1, ans1);
  test(nums2, ans2);
  test(nums3, ans3);

  // batch 2
  final nums4 = [-1, -1, -1, 5, 2, -2, -2, -2];
  final ans4 = 7;
  final nums5 = [-1, -1, 5, -1, 2, -2, -2, -2];
  final ans5 = 6;
  final nums6 = [-3, -2, -1, -2, -3];
  final ans6 = -1;
  final nums7 = [1, 2, 3];
  final ans7 = 6;
  final nums8 = [5, -5, 2, 3];
  final ans8 = 5;
  test(nums4, ans4);
  test(nums5, ans5);
  test(nums6, ans6);
  test(nums7, ans7);
  test(nums8, ans8);
  print("All tests passed");
}

void test(List<int> nums, int expected) {
  final actual = findMaxSubarraySum(nums);
  assert(actual == expected);
}

int findMaxSubarraySum(List<int> nums) {
  // setup
  if (nums.isEmpty) return 0;
  int maxSum = nums[0];
  int maxLeft = 0;
  int maxRight = 1;

  int rollingSum = 0;
  int rollingStart = 0;
  for (int i = 0; i < nums.length; i++) {
    rollingSum += nums[i];
    if (rollingSum > maxSum) {
      // perform both updates here
      maxSum = rollingSum;
      maxLeft = rollingStart;
      maxRight = i + 1;
    }
    if (rollingSum < 0) {
      rollingStart = i + 1;
      rollingSum = 0;
    }
  }

  // return (maxLeft, maxRight);
  return maxSum;
}

/// Finished presentation and deliberation at 7:11pm
