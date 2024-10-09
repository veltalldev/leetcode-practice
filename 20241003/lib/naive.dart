/// 20241003
/// We make the observation that the smallest window that needs to be
/// sorted is THE only window that is out of order, so our
/// job simplifies to detecting the left and right edge of this window
///
/// Being out of order means there exists a pair of indices i and j such that
///   - i < j
///   - arr[i] > arr[j]
/// The end of the out-of-order window is where the values STOP being out
/// of order, i.e. they are in order. Therefore the first pair that is in order
/// after entering the out-of-order window is **potentially** the right edge.
/// The crucial condition is that the values remain in order until the end
/// of the array, or in other words, as long as an out of order pair can
/// still be found, the right boundary is updated to be the value to the
/// right.

(int, int) smallestSortWindow(List<int> arr) {
  int? left = null;
  int? right = null;
  for (int i = 0; i < arr.length - 1; i++) {
    if (arr[i] > arr[i + 1]) {
      left ??= i;
      right = i + 1; // keep re-assigning until no inversions can be found
    }
  }

  if (left == null) {
    // array already sorted
    return (-1, -1);
  }
  return (left, right!);
}
