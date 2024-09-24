/// 20240915
/// This solution takes advantage of the fundamental properties of intervals
/// by sorting them. Intervals exist, by definition, on the number line,
/// so sorting already helps to separate them.
///
/// The solution includes 2 ideas:
/// - The minimum set that covers all interval has to include the
///   maximally intersected intervals
/// - If an interval cannot be intersected with any other, one representative
///   value from it is selected without loss of generality to cover it.
///
/// We maximally intersect all the intersect-ible intervals by sorting them
/// in increasing order of the right boundary. This allows us to iterate from
/// left to right and check the coverage of each interval given the
/// set of those boundary points. If a set is already represented, move on.
/// Otherwise add its right boundary as representation. The idea is if set A
/// can intersect with any of the sets that follow it, the right boundary of
/// A must be part of that intersection.
///
/// We identify non-intersectible intervals by sorting the list similarly, but
/// as a pre-processing step, we check the list from right to left.
/// Given the current interval A:[a1, a2] and the intervals to its left, say
/// B[b1,b2], if b2 < a1 then A is an un-intersectible interval.

Set<int> minimalCoveringSet(List<(int, int)> intervals) {
  final coveringSet = <int>{};
  final nonIntersectingIntervals = <(int, int)>[];

  // pre-processing
  if (intervals.length == 0) return <int>{};
  if (intervals.length == 1) return <int>{intervals[0].$2};
  intervals.sort((a, b) {
    return a.$2.compareTo(b.$2);
  });
  for (var i = intervals.length - 1; i > 0; i--) {
    final currentInterval = intervals[i];
    final leftInterval = intervals[i - 1];
    if (leftInterval.$2 < currentInterval.$1) {
      // current interval is nonintersecting
      nonIntersectingIntervals.add(currentInterval);
      intervals.remove(currentInterval);
    }
  }
  if (intervals.length == 1) {
    nonIntersectingIntervals.add(intervals[0]);
    intervals.remove(intervals[0]);
  } else {
    final leftMostInterval = intervals[0];
    if (leftMostInterval.$2 < intervals[1].$1) {
      // also add index 0
      nonIntersectingIntervals.add(intervals[0]);
      intervals.remove(leftMostInterval);
    }
  }

  // now we process the list and add right boundaries to represent intervals
  for (var i = 0; i < intervals.length; i++) {
    var current = intervals[i];
    if (hasSetCoverage(coveringSet, current)) {
      continue;
    }
    var rightBoundary = current.$2;
    coveringSet.add(rightBoundary);
  }

  nonIntersectingIntervals.forEach((interval) {
    coveringSet.add(interval.$2);
  });

  return coveringSet;
}

// check to see if coverage set contains an element representing the interval
bool hasSetCoverage(Set<int> s, (int, int) interval) {
  var (left, right) = interval;
  var hasCoverage = false;
  s.forEach((number) {
    if (left <= number && number <= right) {
      hasCoverage = true;
    }
  });
  return hasCoverage;
}
