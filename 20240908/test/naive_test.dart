import 'package:test/test.dart';
import '../lib/naive.dart';

void main() {
  group('minOverlapRemovals', () {
    test('should return 0 when there are no overlapping intervals', () {
      var intervals = [(1, 2), (3, 4), (5, 6)];
      expect(minOverlapRemovals(intervals), equals(0));
    });

    test(
        'should return 1 when removing one interval makes the rest non-overlapping',
        () {
      var intervals = [(1, 3), (2, 4), (5, 6)];
      expect(minOverlapRemovals(intervals), equals(1));
    });

    test('should return 2 when two intervals need to be removed', () {
      var intervals = [(1, 5), (2, 6), (3, 7)];
      expect(minOverlapRemovals(intervals), equals(2));
    });

    test('should return 1 for partially overlapping intervals', () {
      var intervals = [(1, 3), (3, 5), (2, 4)];
      expect(minOverlapRemovals(intervals), equals(1));
    });

    test('should return 0 for touching but non-overlapping intervals', () {
      var intervals = [(1, 2), (2, 3), (3, 4)];
      expect(minOverlapRemovals(intervals), equals(0));
    });

    test('should return 0 for a single interval', () {
      var intervals = [(1, 5)];
      expect(minOverlapRemovals(intervals), equals(0));
    });

    test('should handle an empty list of intervals', () {
      var intervals = <(int, int)>[];
      expect(minOverlapRemovals(intervals), equals(0));
    });

    test('should return 1 for complex overlapping intervals', () {
      var intervals = [(1, 3), (2, 6), (4, 5)];
      expect(minOverlapRemovals(intervals), equals(1));
    });
  });
}
