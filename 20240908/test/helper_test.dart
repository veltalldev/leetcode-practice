import 'package:test/test.dart';
import '../lib/helper.dart';

void main() {
  group('hasOverlap', () {
    test('should return false for no overlapping intervals', () {
      var intervals = [(1, 2), (3, 4), (5, 6)];
      expect(hasOverlap(intervals), isFalse);
    });

    test('should return true for overlapping intervals', () {
      var intervals = [(1, 3), (2, 4), (5, 6)];
      expect(hasOverlap(intervals), isTrue);
    });

    test('should return true when intervals exactly overlap', () {
      var intervals = [(1, 5), (1, 5)];
      expect(hasOverlap(intervals), isTrue);
    });

    test('should return true for intervals that partially overlap', () {
      var intervals = [(1, 4), (3, 5)];
      expect(hasOverlap(intervals), isTrue);
    });

    test('should return false when intervals touch but do not overlap', () {
      var intervals = [(1, 2), (2, 3), (3, 4)];
      expect(hasOverlap(intervals), isFalse);
    });

    test('should return false for a single interval', () {
      var intervals = [(1, 5)];
      expect(hasOverlap(intervals), isFalse);
    });

    test('should return true for complex overlapping intervals', () {
      var intervals = [(1, 3), (2, 6), (4, 5)];
      expect(hasOverlap(intervals), isTrue);
    });

    test('should handle empty interval list', () {
      var intervals = <(int, int)>[];
      expect(hasOverlap(intervals), isFalse);
    });
  });
}
