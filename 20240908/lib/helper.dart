// check for overlapping values between a set of intervals
bool hasOverlap(List<(int, int)> intervals) {
  bool hasOverLap = false;
  final set = <int>{};
  intervals.map((interval) {
    return generateRange(interval);
  }).forEach((list) {
    list.forEach((num) {
      if (set.contains(num)) {
        hasOverLap = true;
      } else {
        set.add(num);
      }
    });
  });
  return hasOverLap;
}

// transforms each interval into a corresponding list
// containing elements inclusive of the left bound
// and exclusive of the right bound
List<int> generateRange((int, int) interval) {
  final (i, j) = interval;
  return List.generate(j - i, (index) => i + index);
}
