/// 20240916
/// @TODO: Implement greedy algorithm solution
/// Observe that a choice here (where to jump to) does not affect
/// previous choices. No matter how poorly I perform at the kth index,
/// that choice does not affect how well I may have performed UP TO
/// that point. This strongly implies a greedy approach where making the best
/// decision at every point will lead to a global optimal solution.
///
/// The only way for a greedy choice to be wrong is when we skip over a value
/// that we shouldn't have, so the solution should have to consider
/// every option IN FRONT of us at any given point.
/// This means that given a possible jump up to size k, we need to consider
/// every jump from +1 to +k and the impact it has on the next jump. Jumping to
/// a location i means we are ABLE to continue jumping to locations `i+arr[i]`.
/// This means that we are able to access every spot from +1 to +`(i+arr[i])`.
/// Since we investigate every option we can access, this implies that the
/// largest range `[1, i+arr[i]]` that we can achieve is the best choice.
/// It gives us the most local options to consider, within which we look for
/// the best option, which means we don't miss any better choices.

int minimumJump(List<int> arr) {
  var jumpCount = 0;
  var current = 0;
  final n = arr.length;
  final lastIndex = n - 1;
  while (current < lastIndex) {
    if (jumpCount > 10) {
      return jumpCount;
    }
    final jumpSize = arr[current];
    var maxScore = 0;
    var destination = 0;
    // check all options and their implications
    for (var jumpStep = 1; jumpStep <= jumpSize; jumpStep++) {
      if (current + jumpStep >= lastIndex) {
        // found the last jump, no further need to optimize, just jump
        return ++jumpCount;
      }
      // valid jump option, go ahead and check its score + update max
      final jumpScore = (jumpStep + arr[current + jumpStep]);
      if (jumpScore > maxScore) {
        maxScore = jumpScore;
        destination = current + jumpStep;
      }
    }
    // found the biggest jump destination, make that jump
    jumpCount++;
    current = destination;
  }
  return jumpCount;
}
