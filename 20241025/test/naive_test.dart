import 'package:test/test.dart';
import 'package:leetcode20241025/naive.dart';

void main() {
  group('getPascalRow', () {
    test('row 0 should return [1]', () {
      expect(getPascalRow(0), equals([1]));
    });

    test('row 1 should return [1, 1]', () {
      expect(getPascalRow(1), equals([1, 1]));
    });

    test('row 2 should return [1, 2, 1]', () {
      expect(getPascalRow(2), equals([1, 2, 1]));
    });

    test('row 3 should return [1, 3, 3, 1]', () {
      expect(getPascalRow(3), equals([1, 3, 3, 1]));
    });

    test('row 4 should return [1, 4, 6, 4, 1]', () {
      expect(getPascalRow(4), equals([1, 4, 6, 4, 1]));
    });

    test('should throw ArgumentError for negative row', () {
      expect(() => getPascalRow(-1), throwsArgumentError);
    });

    // Optional: Test for larger rows to check performance
    test('row 20 should have correct length', () {
      final row = getPascalRow(20);
      expect(row.length, equals(21));
      expect(row.first, equals(1));
      expect(row.last, equals(1));
    });

    // Test symmetry property
    test('row 5 should be symmetric', () {
      final row = getPascalRow(5);
      expect(row, equals(row.reversed.toList()));
    });
  });
}
