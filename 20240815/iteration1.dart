/// this file implements the first major improvement over the naive solution
/// In this particular case, it is an improvement on the implementation approach
/// where the existence of a desired number pair A and B that add up to K
/// is determined by the observation that K - B = A, so we loop over B
/// and check for A = K - B in a set of "seen" values

import 'package:test/test.dart';

void main() {
  group('hasPairWithSum', () {
    test('Example case: [10, 15, 3, 7] with k=17', () {
      expect(hasPairWithSum([10, 15, 3, 7], 17), isTrue);
    });

    test('Case with no pairs that sum to k: [1, 2, 3, 4, 5] with k=10', () {
      expect(hasPairWithSum([1, 2, 3, 4, 5], 10), isFalse);
    });

    test('Case with multiple pairs summing to k: [1, 2, 3, 4, 5] with k=6', () {
      expect(hasPairWithSum([1, 2, 3, 4, 5], 6), isTrue);
    });

    test('Case with negative numbers: [-2, -1, 0, 1, 2] with k=0', () {
      expect(hasPairWithSum([-2, -1, 0, 1, 2], 0), isTrue);
    });

    test('Case with a single element: [5] with k=5', () {
      expect(hasPairWithSum([5], 5), isFalse);
    });

    test('Case with empty list: [] with k=0', () {
      expect(hasPairWithSum([], 0), isFalse);
    });

    test('Case with duplicates that sum to k: [5, 1, 5] with k=10', () {
      expect(hasPairWithSum([5, 1, 5], 10), isTrue);
    });

    test('Case where no elements in the list sum to k: [1, 3, 5, 7] with k=20',
        () {
      expect(hasPairWithSum([1, 3, 5, 7], 20), isFalse);
    });

    test(
        'Case with large numbers: [1000000000, 2000000000, 3000000000] with k=5000000000',
        () {
      expect(hasPairWithSum([1000000000, 2000000000, 3000000000], 5000000000),
          isTrue);
    });

    test('Case with large list size with no pair summing to k', () {
      List<int> largeList = List<int>.generate(10000, (index) => index + 1);
      expect(hasPairWithSum(largeList, 20000), isFalse);
    });
  });
}

hasPairWithSum(List<int> largeList, int k) {
  Set<int> seenValues = {};
  for (var num in largeList) {
    if (seenValues.contains(k - num)) {
      return true;
    }
    seenValues.add(num);
  }
  return false;
}
